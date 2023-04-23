require "rails_helper"

describe "CurrentWeather PORO", :vcr do
  it "exists and has attributes" do
    location = "denver,co"
    forecast = ForecastFacade.get_forecast(location)
    current_weather = forecast.current_weather
    # require 'pry'; binding.pry
    expect(current_weather).to be_a(CurrentWeather)
    expect(current_weather.datetime).to be nil
    expect(current_weather.temperature).to be_a(Float)
    expect(current_weather.feels_like).to be_a(Float)
    expect(current_weather.humidity).to be_a(Integer)
    expect(current_weather.uvi).to be_a(Float)
    expect(current_weather.visibility).to be_a(Float)
    expect(current_weather.condition).to be_a(String)
    expect(current_weather.icon).to be_a(String)
  end
end
