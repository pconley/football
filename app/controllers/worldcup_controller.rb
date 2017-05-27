class WorldcupController < ApplicationController
  def query
    result = WorldcupSchema.execute params[:query]
    render json: result
  end
end