class Activity
  attr_reader :id, :type, :destination, :forecast

  def initialize(data)
    @id = nil
    @type = "activities"
    @destination = data[:destination]
    @forecast = forecast
    require 'pry'; binding.pry
  end
end