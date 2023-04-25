require "rails_helper"

describe "Activity Service", :vcr do
  it "can get activities for a city" do
    location = "denver,co"
    forecast = ForecastFacade.current_weather(location)
    activities = ActivityService.get_activities(forecast)

    expect(activities).to be_an(Hash)
    expect(activities).to have_key(:activity)
    expect(activities[:activity]).to be_a(String)
    expect(activities).to have_key(:type)
    expect(activities[:type]).to be_a(String)
    expect(activities).to have_key(:participants)
    expect(activities[:type]).to be_a(String)
    expect(activities).to have_key(:price)
    expect(activities[:price]).to be_a(Float)
  end
end