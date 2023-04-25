require "rails_helper"

describe "Activity PORO" do
  it "exists and has attributes" do
    data = {
      "activity": "Go Bowling",
      "type": "social",
      "participants": 4,
      "price": 0.5,
    }

    activity = Activity.new(data)
    require 'pry'; binding.pry
    expect(activity).to be_a(Activity)
    expect(activity.activity).to be_a(String)
    expect(activity.type).to be_a(String)
    expect(activity.participants).to be_an(Integer)
    expect(activity.price).to be_a(Float)
  end
end