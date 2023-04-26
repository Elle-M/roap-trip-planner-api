class MapQuestService
  
  def self.get_coordinates(location)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params[:key] = ENV['MAP_QUEST_API_KEY']
      req.params[:location] = location
    end
    parse_data(response)[:results][0][:locations][0][:latLng]
  end

  def self.get_travel_time(origin, destination)
    response = conn.get("/directions/v2/route") do |req|
      req.params[:key] = ENV['MAP_QUEST_API_KEY']
      req.params[:from] = origin
      req.params[:to] = destination
    end
    parse_data(response)
  end

  private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com")
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end