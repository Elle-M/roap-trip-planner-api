class ActivityFacade

  def self.get_activities(location)
  #   activities = ActivityService.get_activities(location)

  #   activities.map do |activity|
  #     # require 'pry'; binding.pry
  #   end
  # end  

  def self.get_activities(location)
    forecast = ForecastFacade.current_weather(location)
    ActivityService.get_activities(forecast)
    require 'pry'; binding.pry
  end

  def self.current_weather(location)
    coordinates = MapQuestService.get_coordinates(location)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    weather_data = CurrentWeather.new(forecast)

    current_weather = {
      summary: weather_data.summary,
      temperature: weather_data.temperature
    }
    require 'pry'; binding.pry
  end
end