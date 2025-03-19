class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_album, only: [:show, :edit, :update, :mint]
  before_action :authorize_user, only: [:edit, :update, :mint]
  
  def index
    @albums = Album.where(mint_status: :minted).order(created_at: :desc)
    
    # Filtrage par genre si spécifié
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @albums = @albums.joins(:genres).where(genres: { id: @genre.id })
    end
    
    # Pagination
    @albums = @albums.page(params[:page]).per(12)
  end
  
  def show
    @tracks = @album.tracks.order(:track_number)
  end
  
  def new
    @album = current_user.albums.build
    @album.tracks.build # Pour le form imbriqué
  end
  
  def create
    @album = current_user.albums.build(album_params)
    
    if @album.save
      redirect_to @album, notice: "Album créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Album mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def mint
    # Logique pour le minting d'un album sur Solana
    # Cette fonction sera implémentée plus tard avec l'intégration Solana
    
    if @album.mint_nft
      redirect_to @album, notice: "Le processus de minting a été initié. Cela peut prendre quelques minutes."
    else
      redirect_to @album, alert: "Une erreur s'est produite lors du minting."
    end
  end
  
  private
  
  def set_album
    @album = Album.find(params[:id])
  end
  
  def authorize_user
    redirect_to root_path, alert: "Non autorisé." unless current_user == @album.user
  end
  
  def album_params
    params.require(:album).permit(
      :title, :cover_image, :description, :release_date, :royalty_percentage,
      genre_ids: [],
      tracks_attributes: [:id, :title, :audio_file, :track_number, :individual_sale, :price, :_destroy]
    )
  end
end