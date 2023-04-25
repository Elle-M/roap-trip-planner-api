class Api::V0::RoadTripController < ApplicationController
  def create
    # user = User.find_by(api_key: params[:api_key])
    user = User.find_by(api_key: road_trip_params[:api_key])
    if user
      road_trip = RoadTripFacade.new.create_road_trip(params[:origin], params[:destination])
      require 'pry'; binding.pry
      render json: RoadTripSerializer.new(road_trip), status: 201
      # start_city is here?
    else
      render json: { error: "Invalid credentials" }, status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end