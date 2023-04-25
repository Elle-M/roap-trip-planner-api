class ActivityFacade

  def self.get_activities(location)
    activities = ActivityService.get_activities(location)

    activities.map do |activity|
      # require 'pry'; binding.pry
    end
  end  

  # def self.get_activities(location)
  #   forecast = ForecastFacade.current_weather(location)
  #   ActivityService.get_activities(forecast)
  # end
end