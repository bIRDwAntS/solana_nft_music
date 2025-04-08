module Users
  class SessionsController < Devise::SessionsController
    protected
    
    def after_sign_in_path_for(resource)
      user_path(resource) # Redirige vers la page profil
    end
  end
end