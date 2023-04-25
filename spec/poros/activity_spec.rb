require "rails_helper"

describe "Activity PORO", :vcr do
  it "exists and has attributes" do
    destination = "denver,co"
    forecast = ActivityFacade.current_weather(destination)

    activity = Activity.new(destination, forecast)
    # require 'pry'; binding.pry
    expect(activity).to be_a(Activity)
    expect(activity.id).to eq(nil)
    expect(activity.type).to eq("activities")
    expect(activity.destination).to eq("denver,co")
    expect(activity.forecast).to be(forecast)
  end

  it "can get activities for a city" do
    destination = "denver,co"
    forecast = ActivityFacade.current_weather(destination)
    activity = Activity.new(destination, forecast)
    activity = activity.get_activities

    expect(activity).to be_an(Hash)
    expect(activity).to have_key(:activity)
    expect(activity[:activity]).to be_a(String)
    expect(activity).to have_key(:type)
    expect(activity[:type]).to be_a(String)
    expect(activity).to have_key(:participants)
    expect(activity[:type]).to be_a(String)
    expect(activity).to have_key(:price)
    expect(activity[:price]).to eq(0)
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