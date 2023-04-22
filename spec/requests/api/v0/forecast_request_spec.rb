require "rails_helper"

describe "Forecast API" do
  it "returns forecast for a city" do
    forecast = create(:forecast)
    # location = forecast.location

    get "/api/v0/forecast?location=denver,co"

    expect(response).to be_successful
  end
end