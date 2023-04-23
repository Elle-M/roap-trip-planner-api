class ForecastFacade

  def self.get_forecast(location)
    coordinates = MapQuestService.get_coordinates(location)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    Forecast.new(forecast)
  end
end
