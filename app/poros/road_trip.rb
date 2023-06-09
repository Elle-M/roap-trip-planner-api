class RoadTrip
  
  attr_reader :id,
              :type,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(origin, destination, travel_time, weather_at_eta)
    @id = nil
    @type = "roadtrip"
    @start_city = origin
    @end_city = destination
    @travel_time = travel_time
    @weather_at_eta = weather_at_eta
  end
end