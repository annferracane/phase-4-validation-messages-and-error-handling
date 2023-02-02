class MoviesController < ApplicationController
  wrap_parameters false
  
  def index
    movies = Movie.all
    render json: movies
  end

  def create
    movie = Movie.create(movie_params)
    render json: movie, status: :created
  rescue ApplicationRecord::RecordInvalid => invalid
    render json: { errors: invalid.error.full_mesages }, status: 
    
  end

  private

  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director)
  end
  
end
