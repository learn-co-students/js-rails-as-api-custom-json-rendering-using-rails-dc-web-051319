class BirdsController < ApplicationController

  def index
    birds = Bird.all
    # render json: birds

    # Ruby's except: option, for an array of hashes
    # render json: birds, except: [:created_at, :updated_at]

    # Ruby is implictly adding .to_json() to all these things
    # render json: birds.to_json(except: [:created_at, :updated_at])

    # Ruby's only: option, for an array of hashes
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird

    # Limit the keys to only those we need (no created_at)
    # render json: {id: bird.id, name: bird.name, species: bird.species}

    # the Hash slice method returns a new hash with only the keys that are passed into slice
    # render json: bird.slice(:id, :name, :species)

    # With error handling
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end

    
  end
  
end