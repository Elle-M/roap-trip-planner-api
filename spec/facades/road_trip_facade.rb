require "rails_helper"

describe "Road Trip Facade", :vcr do
  it "can create a road trip"do
    origin = "denver,co"
    destination = "salida,co"
    road_trip = RoadTripFacade.create_road_trip(origin, destination)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to eq(origin)
    expect(road_trip.end_city).to eq(destination)
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.weather_at_eta).to be_a(Hash)
    expect(road_trip.weather_at_eta[:temperature]).to be_a(Float)
    expect(road_trip.weather_at_eta[:condition]).to be_a(String)
  end

  it "can't create a road trip with impossible route" do
    origin = "denver,co"
    destination = "london,uk"
    road_trip = RoadTripFacade.create_road_trip(origin, destination)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to eq(origin)
    expect(road_trip.end_city).to eq(destination)
    expect(road_trip.travel_time).to eq("Impossible route")
    expect(road_trip.weather_at_eta).to eq(nil)
  end
end  



