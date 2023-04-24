class ForecastService 

  def self.get_forecast(lat, lng)
    response = conn.get("/v1/forecast.json") do |req|  
      req.params[:key] = ENV['WEATHER_API_KEY']
      req.params[:q] = "#{lat},#{lng}"
      req.params[:days] = 5
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.weather_at_eta(origin, destination)
    response = conn.get("/v1/forecast.json") do |req|  
      req.params[:key] = ENV['WEATHER_API_KEY']
      req.params[:q] = destination
      req.params[:days] = 5
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.weatherapi.com/")
  end
end