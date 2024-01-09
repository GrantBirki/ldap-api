# frozen_string_literal: true

require "net/http"
require "json"
require_relative "../../spec_helper"

describe "API call to users endpoint" do
  it "returns valid data for all users" do
    uri = URI("http://localhost:8080/v1/users")
    response = Net::HTTP.get(uri)
    users = JSON.parse(response)

    expected_users = [
      { "uid" => "NEBELUNg", "uidnumber" => 20_244 },
      { "uid" => "pixiebob", "uidnumber" => 20_245 },
      { "uid" => "balinese", "uidnumber" => 20_246 },
      { "uid" => "serengeti", "uidnumber" => 20_247 },
      { "uid" => "germanrex", "uidnumber" => 20_248 },
      { "uid" => "khaomanee", "uidnumber" => 20_249 },
      { "uid" => "napoleon", "uidnumber" => 20_250 },
      { "uid" => "blackmanx", "uidnumber" => 20_251 },
      { "uid" => "chausie", "uidnumber" => 20_252 },
      { "uid" => "orientallonghair", "uidnumber" => 20_253 },
      { "uid" => "korat", "uidnumber" => 20_254 },
      { "uid" => "oregonrex", "uidnumber" => 20_255 },
      { "uid" => "DONSKoy", "uidnumber" => 20_256 },
      { "uid" => "russianblue", "uidnumber" => 20_257 },
      { "uid" => "RAGAMUFFIn", "uidnumber" => 20_258 },
      { "uid" => "foldex", "uidnumber" => 20_259 },
      { "uid" => "cheetoh", "uidnumber" => 20_260 },
      { "uid" => "peterbald", "uidnumber" => 20_261 },
      { "uid" => "mainecoon", "uidnumber" => 20_262 },
      { "uid" => "cyprus", "uidnumber" => 20_263 },
      { "uid" => "desertlynx", "uidnumber" => 20_264 },
      { "uid" => "minskin", "uidnumber" => 20_265 },
      { "uid" => "chartreux", "uidnumber" => 20_266 },
      { "uid" => "oJosazuLEs", "uidnumber" => 20_267 },
      { "uid" => "bobtail", "uidnumber" => 20_268 },
      { "uid" => "bengal", "uidnumber" => 20_269 },
      { "uid" => "abyssinian", "uidnumber" => 20_270 }
    ]

    expect(users).to eq(expected_users)
  end

  it "returns valid data for a single user" do
    uri = URI("http://localhost:8080/v1/users/russianblue")
    response = Net::HTTP.get(uri)
    user = JSON.parse(response)

    expected_user = {
      "uid" => "russianblue",
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
end
