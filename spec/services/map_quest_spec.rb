require "rails_helper"

describe "MapQuest Service", :vcr do
  it "can get coordinates for a city" do
    location = "denver,co"
    coordinates = MapQuestService.get_coordinates(location)
   
    expect(coordinates).to be_a(Hash)
    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates[:lng]).to be_a(Float)
  end

  it "can get travel time between two cities" do
    origin = "denver,co"
    destination = "salida,co"
    travel_time = MapQuestService.get_travel_time(origin, destination)

    expect(travel_time).to be_a(Hash)
  end
end
