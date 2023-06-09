class RoadTripFacade

  def create_road_trip(origin, destination)
    travel_time = MapQuestFacade.get_travel_time(origin, destination)
    weather_at_eta = ForecastFacade.get_weather_at_eta(destination, travel_time)
    
    weather_at_eta = 
    {
      condition: weather_at_eta.condition,
      temperature: weather_at_eta.temperature
    }

    if travel_time == nil
      { error: "Impossible route" }
    else
    RoadTrip.new(origin, destination, travel_time, weather_at_eta)
    end
  end
end