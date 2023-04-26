require "rails_helper"

describe "MapQuest Facade" do
  it "can travel time between two cities", :vcr do
    origin = "denver,co"
    destination = "salida,co"
    travel_time = MapQuestFacade.get_travel_time(origin, destination)

    expect(travel_time).to be_a(String)
  end
end