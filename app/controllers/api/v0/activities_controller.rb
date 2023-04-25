class Api::V0::ActivitiesController < ApplicationController
  
  def index 
    destination = params[:location]
    forecast = ActivityFacade.current_weather(destination)
    activities = ActivityFacade.get_activities(destination)
    json = render json: ActivitySerializer.new(activities)
    # require 'pry'; binding.pry
    #I'm not using FastJsonapi, I tried to add :id to my serialzier but it didn't work
    # FastJsonapi::MandatoryField:
    # id is a mandatory field in the jsonapi spec
  end
end