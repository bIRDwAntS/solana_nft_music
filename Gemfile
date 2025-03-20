source "https://rubygems.org"

ruby "3.2.2"

# Rails et infrastructure principale
gem "rails", "~> 7.1.5", ">= 7.1.5.1"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 4.2"
gem "jbuilder"

# Sécurité et authentification
gem "devise", "~> 4.9"         # Pour l'authentification des utilisateurs
gem "pundit", "~> 2.3"         # Pour les autorisations basées sur les politiques
gem "bcrypt", "~> 3.1.7"       # Pour le hachage sécurisé des mots de passe

# Intégration Solana
gem "ed25519", "~> 1.3"        # Pour la cryptographie Solana
gem "solana-ruby", "~> 0.1.4"  # Client Ruby pour interagir avec Solana
gem "rbnacl", "~> 7.1.1"     # Ajout de la dépendance cryptographique

# Gestion des fichiers
gem "image_processing", "~> 1.2"  # Pour le traitement d'images
gem 'cloudinary', require: false  # Pour stocker les fichiers dans S3 en production

# Amélioration de l'UI
gem "view_component", "~> 3.1"    # Pour créer des composants réutilisables
gem "pagy", "~> 6.0"              # Pour la pagination
gem "simple_form", "~> 5.2"       # Pour faciliter la création de formulaires

# Infrastructure Rails
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

# Ajout recommandé pour le projet NFT
gem "active_storage_validations"  # Pour valider les uploads de fichiers audio
gem "ruby-mp3info"                # Pour extraire les métadonnées audio
gem "httparty"                    # Pour interagir avec les APIs externes comme IPFS

# Notifications et expérience utilisateur
gem "noticed", "~> 1.6"           # Pour gérer les notifications

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  
  # Gems pour les tests
  gem "rspec-rails", "~> 6.0"           # Framework de test
  gem "factory_bot_rails", "~> 6.2"     # Pour générer des objets de test
  gem "faker", "~> 3.2"                 # Pour générer des données aléatoires
  gem "pry-rails", "~> 0.3.9"           # Console améliorée pour le debugging
end

group :development do
  gem "web-console"
  gem "annotate", "~> 3.2"              # Pour annoter les modèles avec leurs schémas
  gem "letter_opener", "~> 1.8"         # Pour visualiser les emails en développement
  gem "rack-mini-profiler", "~> 3.1"    # Pour profiler les performances
  gem 'hotwire-livereload', '~> 1.2'    # Pour rafraichir la page à chaque sauvegarde
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 5.3"      # Pour des assertions plus lisibles
  gem "simplecov", require: false       # Pour mesurer la couverture de code
end
gem "redis"

gem "tailwindcss-ruby", "~> 4.0"
