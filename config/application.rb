require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatgptRuby
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.secret_key_base = '+gzZSUi4r9FOBL1WfFi/X3ovk7w+r+9Y2odQlTeXZHVuHcrtM9d80qfNJW5b+dwc5wee4xDDibMevIuIeZzK5IZgEevgUggfIs+UcRT2qI47iSMP6dOS9A+YJ+FczhOr6sxj2GSbdC4ORSFjqVD7NHKZeXWpN+UPv0/PcPqdCI0oRlFgpw2p9rikzoOSxzlb1kPxZ+GGAygyfPouqR0WE8b7y/6m9GZ1pN6jl8dvopufAcQ/ysFntKpbueQdJgy65gNw7clMy9+JzROs29O/B2otLcZ0a0BErOAdfrEvFIssOtbQi8ruE5zdX1Iki4gG9qDDCtUkPpPf9LhLyR6WSAfvNaLGqDEaISGTNGf0TG9J/KpGtY33vrIWfzgVP5lgPK9LaktycJVkhDolizTeDE9NUuhK--mAdvLyLXCfZI8LfO--vixcmrYImzyGBrHM4P2dbw=='
    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
