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

    expected_memberships = [
      { "uid" => "NEBELUNg", "uidnumber" => 20_244 },
      { "uid" => "khaomanee", "uidnumber" => 20_249 },
      { "uid" => "russianblue", "uidnumber" => 20_257 },
      { "uid" => "cheetoh", "uidnumber" => 20_260 },
      { "uid" => "cyprus", "uidnumber" => 20_263 },
      { "uid" => "oJosazuLEs", "uidnumber" => 20_267 }
    ]

    expect(memberships).to eq(expected_memberships)
  end
end
