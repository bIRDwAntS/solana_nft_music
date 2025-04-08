class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show, :edit, :update, :dashboard]
  before_action :authorize_user, only: [:edit, :update, :dashboard]
  before_action :verify_self, only: [:edit, :update, :dashboard]
 

  def index
    @albums = Album.order(created_at: :desc).limit(3)
    # get the artist with the most views
    @trending_artist = User.where(role: "artist").order(views_count: :desc).first
  end
  
  def show
    @albums = @user.albums.where(mint_status: :minted).order(created_at: :desc)
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Profil mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def dashboard
    @albums = @user.albums.order(created_at: :desc)
    @recent_transactions = Transaction.where(seller: @user).or(Transaction.where(buyer: @user)).order(created_at: :desc).limit(10)
    @total_sales = @user.sales.where(status: :completed).sum(:amount)
    # Statistiques supplémentaires pour le tableau de bord
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def authorize_user
    redirect_to root_path, alert: "Unauthorized action. This incident has been logged." unless current_user == @user
  end
  
  def user_params
    params.require(:user).permit(:username, :bio, :wallet_address, :profile_image)
  end

  def verify_self
    unless @user.id == current_user.id
      # Log unauthorized access attempt for intrusion detection
      Rails.logger.warn "SECURITY WARNING: User #{current_user.id} attempted to access user #{@user.id}'s account"
      
      # Redirect with a generic message that doesn't reveal too much information
      redirect_to root_path, alert: "Unauthorized action. This incident has been logged."
    end
  end

  



end

