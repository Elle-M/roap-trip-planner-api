require "rails_helper"

describe "Road Trip API", :vcr do
  before :each do
    @user = User.create!(email: "art@email.com", password: "password2", password_confirmation: "password2")
  end

  it "can get a road trip" do
    body = {
      "origin": "salida, co",
      "destination": "denver, co",
      "api_key": "#{@user.api_key}"
    }

    post "/api/v0/road_trip", params: body.to_json, headers: { 'Content-Type': 'application/json' }
   
    trip = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(trip[:data][:attributes][:start_city]).to eq("salida, co")
    expect(trip[:data][:attributes][:end_city]).to eq("denver, co")
    expect(trip[:data][:attributes][:travel_time]).to be_a(String)
    expect(trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(trip[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)
  end

  it "can't get a road trip with bad api key", :vcr do
    body = {
      "origin": "salida, co",
      "destination": "denver, co",
      "api_key": "bad_key"
    }

    post "/api/v0/road_trip", params: body.to_json, headers: { 'Content-Type': 'application/json' }
   
    trip = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(trip[:error]).to eq("Invalid credentials")
  end

  it "can't get a road trip with missing api key", :vcr do
    body = {
      "origin": "salida, co",
      "destination": "denver, co"
    }

    post "/api/v0/road_trip", params: body.to_json, headers: { 'Content-Type': 'application/json' }
   
    trip = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(trip[:error]).to eq("Invalid credentials")
  end
end    