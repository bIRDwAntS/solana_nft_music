# frozen_string_literal: true
SimpleForm.setup do |config|
  config.wrappers :default, class: 'form-group' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input, error_class: 'is-invalid'
    b.use :error, wrap_with: { tag: :div, class: 'invalid-feedback' }
    b.use :hint, wrap_with: { tag: :small, class: 'form-text text-muted' }
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :default
  
  # Supprime le texte des champs obligatoires
  config.default_wrapper = :default
  
  # Modifie la façon dont les labels sont générés
  # Pour ajouter une étoile après le label si nécessaire:
  config.label_text = lambda { |label, required, explicit_label| required ? "#{label} " : "#{label}" }
  
  # Reste de votre configuration inchangé
  config.boolean_style = :nested
  config.button_class = 'btn'
  config.error_notification_tag = :div
  config.error_notification_class = 'error_notification'
  config.browser_validations = false
  config.boolean_label_class = 'checkbox'
end