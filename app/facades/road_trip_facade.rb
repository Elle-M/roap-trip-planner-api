class RoadTripFacade

  def create_road_trip(origin, destination)
    # require 'pry'; binding.pry
    travel_time = MapQuestService.new.get_travel_time(origin, destination)
    weather_at_eta = ForecastService.new.get_weather_at_eta(destination, travel_time)
    RoadTrip.new(origin, destination, travel_time, weather_at_eta)
  end

  # def get_travel_time(origin, destination)
  #   MapQuestService.new.get_travel_time(origin, destination)
  # end

  # def get_weather_at_eta(destination, travel_time)
  #   ForecastService.new.get_weather_at_eta(destination, travel_time)
  # end
end