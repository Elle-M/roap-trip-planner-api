require "rails_helper"

describe "Activity Facade", :vcr do
  it "can get activities for a city" do
    destination = "denver,co"
    activities = ActivityFacade.get_activities(destination)

    expect(activities).to be_an(Hash)
    expect(activities).to have_key(:activity)
    expect(activities[:activity]).to be_a(String)
    expect(activities).to have_key(:type)
    expect(activities[:type]).to be_a(String)
    expect(activities).to have_key(:participants)
    expect(activities[:type]).to be_a(String)
    expect(activities).to have_key(:price)
    expect(activities[:price]).to be(0)
  end

  it "can get current forecast for a city with a state" do
    destination = "denver,co"
    forecast = ActivityFacade.current_weather(destination)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:summary)
    expect(forecast).to have_key(:temperature)
  end

  it "can get a random recreational activity" do
    destination = "denver,co"
    activity = ActivityFacade.get_activities(destination)
    activity = Activity.random_recreational_activity
   
    expect(activity).to be_a(String)
    expect(activity).to_not be_empty
  end

  it "can get a random cooking activity" do
    destination = "denver,co"
    activity = ActivityFacade.get_activities(destination)
    activity = Activity.random_cooking_activity
   
    expect(activity).to be_a(String)
    expect(activity).to_not be_empty
  end
end