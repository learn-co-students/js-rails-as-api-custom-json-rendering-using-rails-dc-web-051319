class BirdsController < ApplicationController

  def index
    @birds = Bird.all
    render json: @birds, except: [:created_at, :updated_at]
  end

  def show
    @bird = Bird.find(params[:id])
    
    if @bird
      render json: @bird, only: [:id, :name, :species]
    else 
      render json: { message: 'bird not found' }
    end

  end

end