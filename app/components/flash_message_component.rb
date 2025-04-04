class FlashMessageComponent < ViewComponent::Base
    def initialize(flash:)
      @flash = flash
    end
  end