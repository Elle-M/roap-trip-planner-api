class ForecastFacade
  # def initialize(location)
  #   @location = location
  # end

  def self.get_forecast(location)
    coordinates = MapQuestService.get_coordinates(location)
    forecast = ForecastService.get_forecast(coordinates)
    Forecast.new(forecast)
  end
end