Rails.application.configure do
    config.view_component.preview_paths << "#{Rails.root}/spec/components/previews" if Rails.env.development?
    config.view_component.preview_controller = "PreviewController"
    config.view_component.show_previews = Rails.env.development?
  end