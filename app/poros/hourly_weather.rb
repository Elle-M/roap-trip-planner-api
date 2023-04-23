class HourlyWeather
  attr_reader :time,
              :temperature,
              :condition,
              :icon

  def initialize(location)
    # require 'pry'; binding.pry
    @time = Date.parse(location[:forecast][:forecastday][0][:hour][0][:time]).strftime('%H:%M')
    @temperature = location[:forecast][:forecastday][0][:hour][0][:temp_f]
    @condition = location[:forecast][:forecastday][0][:hour][0][:condition][:text]
    @icon = location[:forecast][:forecastday][0][:hour][0][:condition][:icon]
  end
end