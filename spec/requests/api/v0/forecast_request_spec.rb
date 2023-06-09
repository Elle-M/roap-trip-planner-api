require "rails_helper"

describe "Forecast API" do
  it "can get forecast for a city", :vcr do

    get "/api/v0/forecast?location=denver,co"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:data)
    expect(forecast[:data]).to be_a(Hash)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data][:type]).to eq("forecast")
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to be_a(Hash)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    expect(forecast[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
    expect(forecast[:data][:attributes][:hourly_weather]).to be_an(Array)
  end

  it "can't get forecast for a city with bad location", :vcr do

    get "/api/v0/forecast?location="

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq("application/json; charset=utf-8")

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:error)
    expect(forecast[:error]).to eq("Please provide a location")
  end
end  