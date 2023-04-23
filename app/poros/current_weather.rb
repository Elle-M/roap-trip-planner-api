class CurrentWeather
  attr_reader :datetime,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :condition,
              :icon

  def initialize(location)
    # require 'pry'; binding.pry
    @datetime = location[:localtime]
    @temperature = location[:current][:temp_f]
    @feels_like = location[:current][:feelslike_f]
    @humidity = location[:current][:humidity]
    @uvi = location[:current][:uv]
    @visibility = location[:current][:vis_miles]
    @condition = location[:current][:condition][:text]
    @icon = location[:current][:condition][:icon]
  end
end