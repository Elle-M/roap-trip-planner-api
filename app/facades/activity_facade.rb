class ActivityFacade

 def self.get_activities(location)
    forecast = current_weather(location)
    all_activities = ActivityService.get_activities(forecast)

    activities =
      { activity: all_activities[:activity],
        type: all_activities[:type],
        participants: all_activities[:participants],
        price: all_activities[:price] }
    # require 'pry'; binding.pry
  end

  def self.current_weather(location)
    coordinates = MapQuestService.get_coordinates(location)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    weather_data = CurrentWeather.new(forecast)

    current_weather = {
      summary: weather_data.condition,
      temperature: weather_data.temperature
    }
    # require 'pry'; binding.pry
  end
end