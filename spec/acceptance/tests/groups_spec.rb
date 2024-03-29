# frozen_string_literal: true

require "net/http"
require "json"
require_relative "../../spec_helper"

describe "API call to groups endpoint" do
  it "returns valid data for all groups" do
    uri = URI("http://localhost:8080/v1/groups")
    response = Net::HTTP.get(uri)
    users = JSON.parse(response)

    expected_groups = [
      { "name" => "colonel-meow" },
      { "name" => "garfield" },
      { "name" => "lockout" }
    ]

    expect(users).to eq(expected_groups)
  end

  it "returns valid data for the memberships of a group" do
    uri = URI("http://localhost:8080/v1/groups/colonel-meow/members")
    response = Net::HTTP.get(uri)
    memberships = JSON.parse(response)

    expected_memberships = JSON.parse(File.read("spec/acceptance/tests/data/colonel-meow.json"))

    expect(memberships).to eq(expected_memberships)
  end

  it "returns a 404 when a group is not found" do
    uri = URI("http://localhost:8080/v1/groups/does-not-exist/members")
    response = Net::HTTP.get_response(uri)
    expect(response.code).to eq("404")
  end
end
