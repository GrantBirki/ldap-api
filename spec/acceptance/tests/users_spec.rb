# frozen_string_literal: true

require "net/http"
require "json"
require_relative "../../spec_helper"

describe "API call to users endpoint" do
  it "returns valid data for all users" do
    uri = URI("http://localhost:8080/v1/users")
    response = Net::HTTP.get(uri)
    users = JSON.parse(response)

    expected_users = JSON.parse(File.read("spec/acceptance/tests/data/users.json"))

    expect(users).to eq(expected_users)
  end

  it "returns valid data for a single user" do
    uri = URI("http://localhost:8080/v1/users/russianblue")
    response = Net::HTTP.get(uri)
    user = JSON.parse(response)

    expected_user = {
      "uid" => "russianblue",
      "manager" => {
        "rdns" => [
          {
            "uid" => "mainecoon"
          },
          {
            "ou" => "People"
          },
          {
            "dc" => "kittens"
          },
          {
            "dc" => "net"
          }
        ]
      },
      "mail" => "russianblue@kittens.net",
      "employeenumber" => "000014",
      "uidnumber" => 20_257
    }

    expect(user).to eq(expected_user)
  end

  it "returns valid data for a single user's group memberships" do
    uri = URI("http://localhost:8080/v1/users/russianblue/groups")
    response = Net::HTTP.get(uri)
    user = JSON.parse(response)

    expected_response = [
      { "name" => "colonel-meow" },
      { "name" => "garfield" }
    ]

    expect(user).to eq(expected_response)
  end

  it "returns a 404 when a user is not found" do
    uri = URI("http://localhost:8080/v1/users/does-not-exist")
    response = Net::HTTP.get_response(uri)
    expect(response.code).to eq("404")
  end

  it "returns a 404 when a user is not found while calling /groups" do
    uri = URI("http://localhost:8080/v1/users/does-not-exist/groups")
    response = Net::HTTP.get_response(uri)
    expect(response.code).to eq("404")
  end
end
