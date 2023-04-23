describe "rails_helper" do

  describe "Forecast PORO", :vcr do
    it "can get forecast for a city" do
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
  end
end