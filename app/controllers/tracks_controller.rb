class TracksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_album
  before_action :set_track, only: [:show, :edit, :update, :mint]
  before_action :authorize_user, only: [:new, :create, :edit, :update, :mint]
  
  def show
  end
  
  def new
    @track = @album.tracks.build
  end
  
  def create
    @track = @album.tracks.build(track_params)
    
    if @track.save
      redirect_to album_path(@album), notice: "Piste ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @track.update(track_params)
      redirect_to album_track_path(@album, @track), notice: "Piste mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def mint
    # Logique pour le minting d'une piste individuelle sur Solana
    # Cette fonction sera implémentée plus tard avec l'intégration Solana
    
    if @track.mint_individual_nft
      redirect_to album_track_path(@album, @track), notice: "Le processus de minting a été initié. Cela peut prendre quelques minutes."
    else
      redirect_to album_track_path(@album, @track), alert: "Une erreur s'est produite lors du minting."
    end
  end
  
  private
  
  def set_album
    @album = Album.find(params[:album_id])
  end
  
  def set_track
    @track = @album.tracks.find(params[:id])
  end
  
  def authorize_user
    redirect_to root_path, alert: "Non autorisé." unless current_user == @album.user
  end
  
  def track_params
    params.require(:track).permit(:title, :audio_file, :track_number, :individual_sale, :price)
  end
end