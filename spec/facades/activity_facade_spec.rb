require "rails_helper"

describe "Activity Facade", :vcr do
  it "can get activities for a city" do
    location = "denver,co"
    activities = ActivityFacade.get_activities(location)

    expect(activities).to be_an(Hash)
  end
end