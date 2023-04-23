require "spec_helper"

describe ForecastService do
  it "can get forecast for a city", :vcr do
    forecast = ForecastService.get_forecast(39.738453, -104.984853)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:current)
    expect(forecast[:current]).to be_a(Hash)
  end
end