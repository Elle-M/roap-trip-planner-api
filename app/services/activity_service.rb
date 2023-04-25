class ActivityService
  def self.get_activities(forecast)
    response = conn.get("/api/activity")
    parse_data(response)
  end

  private

  def self.conn
    Faraday.new(url: "http://www.boredapi.com/api/activity/")
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end