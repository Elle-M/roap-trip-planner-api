class ForecastService 
  # def self.forecast(latitude, longitude)
  #   response = conn.get("/v1/forecast.json") do |req|  
  #     req.params[:key] = ENV['WEATHER_API_KEY']
  #     req.params[:q] = "#{latitude},#{longitude}"
  #     req.params[:days] = 5
  #   end
  # end

  def self.get_forecast(coordinates)
    response = conn.get("/v1/forecast.json") do |req|  
      req.params[:key] = ENV['WEATHER_API_KEY']
      req.params[:q] = "#{coordinates[:lat]},#{coordinates[:lng]}"
      req.params[:days] = 5
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.weatherapi.com/")
  end
end