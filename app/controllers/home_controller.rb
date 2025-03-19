# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @albums = Album.all  # ou Album.order(created_at: :desc) pour avoir les plus récents
  end
end




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
