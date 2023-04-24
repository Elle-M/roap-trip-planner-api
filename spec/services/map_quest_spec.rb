require "rails_helper"

describe "MapQuest Service", :vcr do
  it "can get coordinates for a city" do
    location = "denver,co"
    coordinates = MapQuestService.get_coordinates(location)
   
    expect(coordinates).to be_a(Hash)
    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates[:lng]).to be_a(Float)
  end
end
