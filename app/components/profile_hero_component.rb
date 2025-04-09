class ProfileHeroComponent < ViewComponent::Base
  def initialize(user:, stats: {})
  @user = user
  @total_albums = stats[:total_albums].to_i  # Converts the value to integer, ensuring nil or non-numeric values become 0
  # This defensive programming approach guarantees we always have a numeric value
  @total_tracks = stats[:total_tracks].to_i
  @total_sales = stats[:total_sales].to_i
end

    def greeting
        current_hour = Time.now.hour
        
        if current_hour < 12
          "Good morning"
        elsif current_hour < 18
          "Good afternoon"
        else
          "Good evening"
        end
      end

      def has_albums? # Predicate method that checks if the artist has any albums
        # Returns true if total_albums is greater than zero, false otherwise
        # Used for conditional display of album-related information in the template
        @total_albums > 0
      end
      
      def has_sales?
        @total_sales > 0
      end


    end