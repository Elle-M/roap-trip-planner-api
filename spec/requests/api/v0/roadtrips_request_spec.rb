require "rails_helper"

describe "Road Trip API" do
  it "can get a roadtrip" do
    user = User.create!(email: "art@email.com", password: "password2", password_confirmation: "password2")

    body = {
      "origin": "salida, co",
      "destination": "denver, co",
      "api_key": "#{user.api_key}"
    }

    post "/api/v0/road_trip", params: body.to_json, headers: { 'Content-Type': 'application/json' }

    trip = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(trip[:data][:attributes][:start_city]).to eq("salida, co")
    expect(trip[:data][:attributes][:end_city]).to eq("denver, co")
    expect(trip[:data][:attributes][:travel_time]).to be_a(String)
    expect(trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(trip[:data][:attributes][:weather_at_eta][:date_time]).to be_a(String)
    expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end    