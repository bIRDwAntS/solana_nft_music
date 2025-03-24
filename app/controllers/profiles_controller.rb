class ProfilesController < ApplicationController
    before_action :authenticate_user!
    
    def edit
      @user = current_user
    end
    
    def update
      @user = current_user
      
      if @user.update(profile_params)
        redirect_to user_path(@user), notice: "Your profile has been updated successfuly"
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    private
    
    def profile_params
      params.require(:user).permit(:username, :bio, :profile_image, :wallet_address, :artist)
    end
  end