class AlbumFormComponent < ViewComponent::Base
    attr_reader :album, :genres
  
    def initialize(album:, genres:)
      @album = album
      @genres = genres
    end
  
    # Helper method to determine the form action URL
    def form_url
      album.new_record? ? albums_path : album_path(album)
    end
  
    # Helper method to determine the form method
    def form_method
      album.new_record? ? :post : :patch
    end
  end