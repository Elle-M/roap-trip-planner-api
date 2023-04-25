class Activity
  attr_reader :id, :type, :destination, :forecast

  def initialize(location, forecast)
    @id = nil
    @type = "activities"
    @destination = location
    @forecast = forecast
    # require 'pry'; binding.pry
  end
end