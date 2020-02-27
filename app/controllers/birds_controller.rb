class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds, only: [:id, :name, :species]
  end
  def show
  	bird = Bird.find_by_id(params[:id])
  	if bird
  		render json: bird, except: [:updated_at, :created_at]
  	else
  		render json: {message: "Bird not found."}
  	end
  end
end