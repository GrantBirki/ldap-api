# frozen_string_literal: true

require "net/http"
require "json"
require_relative "../../spec_helper"

describe "API call to groups endpoint" do
  it "returns valid data" do
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
end
