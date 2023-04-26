require "rails_helper"

describe "DailyWeather PORO", :vcr do
  it "exists and has attributes" do
    location = "denver,co"
    forecast = ForecastFacade.get_forecast(location)
    daily_weather = forecast.daily_weather.first
  
    expect(daily_weather).to be_a(DailyWeather)
    expect(daily_weather.date).to be_a(String)
    expect(daily_weather.sunrise).to be_a(String)
    expect(daily_weather.sunset).to be_a(String)
    expect(daily_weather.max_temp).to be_a(Float)
    expect(daily_weather.min_temp).to be_a(Float)
    expect(daily_weather.condition).to be_a(String)
    expect(daily_weather.icon).to be_a(String)
  end
end