class EmptyAlbumComponent < ViewComponent::Base
    def initialize(show_cta: true)
      @show_cta = show_cta
    end
  end