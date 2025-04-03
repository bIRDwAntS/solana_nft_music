# FormComponent encapsulates HTML form configuration for music album uploads
# It provides a reusable interface for creating consistent forms across the application
# while handling the necessary configuration for file uploads (multipart encoding)
# and standardizing form submission methods and endpoints
#
# Note: Authentication forms (sign up/sign in) are handled separately by Devise
# and can be found in app/views/devise/ directory. They don't use this component
# due to their specific requirements and customizations.
class FormComponent < ViewComponent::Base
    attr_reader :form, :url, :method, :multipart
  
    def initialize(form:, url:, method: :post, multipart: false)
      @form = form
      @url = url
      @method = method
      @multipart = multipart # Required for music file uploads - enables multipart/form-data encoding to handle binary audio files
    end
  end

  