class TrendingArtistComponent < ViewComponent::Base
    attr_reader :artist
  
    def initialize(artist:)
      @artist = artist
    end
  
    def render?
      artist.present?
    end
  end