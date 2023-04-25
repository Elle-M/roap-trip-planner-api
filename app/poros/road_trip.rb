class RoadTrip
  attr_reader :id,
              :type,
              :attributes

  def initialize(origin, destination, travel_time, weather_at_eta)
    @id = nil
    @type = "roadtrip"
    @attributes = {
      start_city: origin,
      end_city: destination,
      travel_time: travel_time,
      weather_at_eta: weather_at_eta
    }
    require 'pry'; binding.pry
    # start_city present
  end

  def weather_at_eta
    #need to fix this to return a hash with the correct keys
    if @attributes[:weather_at_eta][:temperature].nil?
      {
        temperature: "impossible to determine",
        conditions: "impossible to determine"
      }
    else
      @attributes[:weather_at_eta]
    end
  end
end