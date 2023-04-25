require "rails_helper"

describe "Activity API", :vcr do
  it "can get activities for a city" do
    destination = "denver,co"
    get "/api/v0/activities?location=#{destination}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    # activities = JSON.parse(response.body, symbolize_names: true)

    # expect(activities).to be_an(Array)
    # expect(activities.first).to be_a(Hash)
    # expect(activities.first).to have_key(:activity)
    # expect(activities.first[:activity]).to be_a(String)
    # expect(activities.first).to have_key(:type)
    # expect(activities.first[:type]).to be_a(String)
    # expect(activities.first).to have_key(:participants)
    # expect(activities.first[:participants]).to be_an(Integer)
    # expect(activities.first).to have_key(:price)
    # expect(activities.first[:price]).to be_a(Float)
  end
end