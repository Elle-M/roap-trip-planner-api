class Api::V0::ForecastController < ApplicationController

  def index
    forecast = ForecastFacade.get_forecast(params[:location])
    # require 'pry'; binding.pry  
    render json: ForecastSerializer.new(forecast)
  end
end
