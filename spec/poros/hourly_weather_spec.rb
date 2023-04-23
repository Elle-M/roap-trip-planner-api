require "rails_helper"

describe "HourlyWeather PORO", :vcr do
  it "exists and has attributes" do
    location = "denver,co"
    forecast = ForecastFacade.get_forecast(location)
    hourly_weather = forecast.hourly_weather.first

    expect(hourly_weather).to be_a(HourlyWeather)
    expect(hourly_weather.time).to be_a(String)
    expect(hourly_weather.temperature).to be_a(Float)
    expect(hourly_weather.condition).to be_a(String)
    expect(hourly_weather.icon).to be_a(String)
  end
end