# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    # @albums = Album.all 
    @albums = Album.order(created_at: :desc).limit(3)
    @trending_artist = User.where(role: "artist").order(views_count: :desc).first
  end
end

# ------- Render the trending Artist
def update_trending_artist
  @trending_artist = User.where(role: "artist").order(views_count: :desc).first
  
  respond_to do |format|
    format.turbo_stream do
      render turbo_stream: turbo_stream.replace(
        "trending_artist",
        html: render_to_string(
          TrendingArtistComponent.new(artist: @trending_artist)
        )
      )
    end
  end
end


# ------- Render the minted albul + other pages
# class HomeController < ApplicationController
#   def index
#     @featured_albums = Album.where(mint_status: :minted).order(created_at: :desc).limit(6)
#     @genres = Genre.all.limit(10)
#     @recent_transactions = Transaction.where(status: :completed).order(created_at: :desc).limit(5)
#   end
  
#   def about
#   end
  
#   def faq
#   end
  
#   def terms
#   end
  
#   def privacy
#   end
# end
