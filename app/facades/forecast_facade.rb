class ForecastFacade

  def self.get_forecast(location)
    coordinates = MapQuestService.get_coordinates(location)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    Forecast.new(forecast)
  end

  def self.current_weather(location)
    coordinates = MapQuestService.get_coordinates(location)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    CurrentWeather.new(forecast)
  end

  def self.daily_weather(location)
    coordinates = MapQuestService.get_coordinates(location)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    DailyWeather.new(forecast)
  end

  def self.hourly_weather(location)
    coordinates = MapQuestService.get_coordinates(location)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    HourlyWeather.new(forecast)
  end

  def self.get_weather_at_eta(destination, travel_time)
    coordinates = MapQuestService.get_coordinates(destination)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    CurrentWeather.new(forecast)
  end
end
