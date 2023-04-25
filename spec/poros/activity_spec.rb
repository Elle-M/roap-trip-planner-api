require "rails_helper"

describe "Activity PORO", :vcr do
  it "exists and has attributes" do
    location = "denver,co"
    forecast = ActivityFacade.current_weather(location)

    activity = Activity.new(location, forecast)
    # require 'pry'; binding.pry
    expect(activity).to be_a(Activity)
    expect(activity.id).to eq(nil)
    expect(activity.type).to eq("activities")
    expect(activity.destination).to eq("denver,co")
    expect(activity.forecast).to be(forecast)
  end
end