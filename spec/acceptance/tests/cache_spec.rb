# frozen_string_literal: true

require "net/http"
require "json"
require "yaml"
require_relative "../../spec_helper"

# note: these tests could be a bit flaky because they depend on the timing of the cache
describe "API calls to validate caching" do
  before do
    @config = YAML.safe_load_file("spec/acceptance/ldap-api/config/config.yml")
  end

  it "returns a non-cached response the first time and a cached response the second time" do
    uri = URI("http://localhost:8080/v1/users/cyprus")

    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get(uri)
    end

    expect(response["Cache-Ttl"].to_i).to eq(@config["ldap"]["cache"]["ttl"])

    # now make the exact same request and expect the TTL to be less the original TTL
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get(uri)
    end

    expect(response["Cache-Ttl"].to_i).to be < @config["ldap"]["cache"]["ttl"]
  end
end
