class LatestAlbumComponent < ViewComponent::Base
    def initialize(album:)
      @album = album
    end
    
    def render?
      @album.present?
    end
  end