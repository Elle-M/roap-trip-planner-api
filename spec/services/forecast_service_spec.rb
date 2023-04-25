require "spec_helper"

describe ForecastService do
  it "can get forecast for a city", :vcr do
    forecast = ForecastService.get_forecast(39.738453, -104.984853)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:current)
    expect(forecast[:current]).to be_a(Hash)
  end

  it "can get weather at eta", :vcr do
    weather_at_eta = ForecastService.weather_at_eta("denver,co", "salida,co")
  
    expect(weather_at_eta).to be_a(Hash)
    expect(weather_at_eta).to have_key(:current)
    expect(weather_at_eta[:current]).to be_a(Hash)
    expect(weather_at_eta[:current]).to have_key(:temp_f)
    expect(weather_at_eta[:current][:temp_f]).to be_a(Float)
    expect(weather_at_eta[:current]).to have_key(:condition)
    expect(weather_at_eta[:current][:condition]).to be_a(Hash)
    expect(weather_at_eta[:current][:condition]).to have_key(:text)
    expect(weather_at_eta[:current][:condition][:text]).to be_a(String)
    expect(weather_at_eta[:current][:condition]).to have_key(:icon)
    expect(weather_at_eta[:current][:condition][:icon]).to be_a(String)
  end
end