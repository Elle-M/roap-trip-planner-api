class Forecast  
  
  attr_reader :id,
              :type,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(location)
    @id = nil
    @type = "forecast"
    @current_weather = CurrentWeather.new(location)
    @daily_weather = [DailyWeather.new(location)]
    @hourly_weather = [HourlyWeather.new(location)]
  end
end