require "rails_helper"

describe "Forecast Facade", :vcr do
  it "can get forecast for a city with a state" do
    location = "denver,co"
    forecast = ForecastFacade.get_forecast(location)

    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to eq(nil)
    expect(forecast.type).to eq("forecast")
    expect(forecast.current_weather).to be_a(CurrentWeather)
    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.daily_weather.first).to be_a(DailyWeather)
    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.hourly_weather.first).to be_a(HourlyWeather)
  end

  it "can get current weather for a city with a state" do
    location = "denver,co"
    current_weather = ForecastFacade.current_weather(location)

    expect(current_weather).to be_a(CurrentWeather)
  end

  it "can get daily weather for a city with a state" do
    location = "denver,co"
    daily_weather = ForecastFacade.daily_weather(location)

    expect(daily_weather).to be_a(DailyWeather)
  end

  it "can get hourly weather for a city with a state" do
    location = "denver,co"
    hourly_weather = ForecastFacade.hourly_weather(location)

    expect(hourly_weather).to be_a(HourlyWeather)
  end
end