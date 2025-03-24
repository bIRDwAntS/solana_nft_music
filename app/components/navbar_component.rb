class NavbarComponent < ViewComponent::Base
  def initialize(user_signed_in:, current_user: nil)
    @user_signed_in = user_signed_in
    @current_user = current_user
  end
  
  attr_reader :user_signed_in, :current_user
  end