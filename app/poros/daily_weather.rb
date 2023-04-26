class DailyWeather
  
  attr_reader :date,
              :sunrise, 
              :sunset,
              :max_temp,
              :min_temp,
              :condition,
              :icon

  def initialize(location)
    @date = Time.parse(location[:location][:localtime]).strftime('%Y-%m-%d')
    @sunrise = location[:forecast][:forecastday][0][:astro][:sunrise]
    @sunset = location[:forecast][:forecastday][0][:astro][:sunset]
    @max_temp = location[:forecast][:forecastday][0][:day][:maxtemp_f]
    @min_temp = location[:forecast][:forecastday][0][:day][:mintemp_f]
    @condition = location[:forecast][:forecastday][0][:day][:condition][:text]
    @icon = location[:forecast][:forecastday][0][:day][:condition][:icon]
  end
end

