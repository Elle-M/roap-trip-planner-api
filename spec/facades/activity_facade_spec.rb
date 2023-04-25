require "rails_helper"

describe "Activity Facade", :vcr do
  xit "can get activities for a city" do
    location = "denver,co"
    activities = ActivityFacade.get_activities(location)

    expect(activities).to be_an(Hash)
  end

  it "can get current forecast for a city with a state" do
    location = "denver,co"
    forecast = ActivityFacade.current_weather(location)

    expect(forecast).to be_a(Hash)
  end
end