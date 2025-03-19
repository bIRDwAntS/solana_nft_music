# app/controllers/genres_controller.rb
class GenresController < ApplicationController
  def index
    @genres = Genre.all.order(:name)
  end
  
  def show
    @genre = Genre.find(params[:id])
    @albums = @genre.albums.where(mint_status: :minted).order(created_at: :desc).page(params[:page]).per(12)
  end
end