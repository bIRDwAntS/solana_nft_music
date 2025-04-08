# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :artist])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :bio, :profile_image, :wallet_address])
    end

    # after signup redirection to edit profile page
    def after_sign_in_path_for(resource)
      # If the user just signed in and does not have a bior or image yet
      # will be redirected to the profile page for completion
      if resource.sign_in_count == 1 && (resource.bio.blank? || !resource.profile_image.attached?)
        edit_profile_path
      else
        stored_location_for(resource) ||  user_path(resource) #redirect user to their profile page
    
      end
    end
  end