class ActivityFacade

 def self.get_activities(destination)
    forecast = current_weather(destination)
    all_activities = ActivityService.get_activities(forecast)

    activities =
      { activity: all_activities[:activity],
        type: all_activities[:type],
        participants: all_activities[:participants],
        price: all_activities[:price] }

    if forecast[:temperature] >= 60
      activities[:recreational] = Activity.random_recreational_activity
    elsif forecast[:temperature] >= 50 && forecast[:temperature] < 60
      activities[:busywork] = Activity.random_busywork_activity
    else forecast[temperature] < 50 
      activities[:cooking] = Activity.random_cooking_activity
    end
    activities[:relaxation] = Activity.random_relaxation_activity
    activities
    # require 'pry'; binding.pry
  end

  

  def self.current_weather(destination)
    coordinates = MapQuestService.get_coordinates(destination)
    forecast = ForecastService.get_forecast(coordinates[:lat], coordinates[:lng])
    weather_data = CurrentWeather.new(forecast)

    current_weather = {
      summary: weather_data.condition,
      temperature: weather_data.temperature
    }
    # require 'pry'; binding.pry
  end
end