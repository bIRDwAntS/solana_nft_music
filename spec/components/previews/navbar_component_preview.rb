class NavbarComponentPreview < ViewComponent::Preview
    def default
      render(NavbarComponent.new)
    end
  
    def with_user
      user = User.new(
        username: "artistenft",
        email: "artist@example.com"
      )
      
      # Simuler une image de profil attachée
      # Note: Ceci est juste pour la preview et ne fonctionnera pas réellement
      # user.profile_image.attach(...)
      
      render(NavbarComponent.new(current_user: user))
    end
  end