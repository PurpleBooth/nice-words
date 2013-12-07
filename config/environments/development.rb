FeelGood::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log


  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  redis = Redis.new

  NiceMessages.redis = redis
  NiceMessageUpdater.redis = redis

  NiceMessages.redis_wordlist_key = "dev-nice-words"
  NiceMessageUpdater.update_needed_key = "dev-words-fresh"

  NiceMessageUpdater.twitter =  Twitter::REST::Client.new do |config|
    config.consumer_key        = "DyMK3sCNutKVeyopjAc3w"
    config.consumer_secret     = "HwhCYpTriVs0scKtAYERsK5mqBx3LiutX6xCjlnQFQ4"
    config.access_token        = "938641453-tLkc6rL8KMRnII5hRhPZsn1H1erEznzbyZ6yq7ve"
    config.access_token_secret = "KwkQ4ab3lkHjNRGENlRDRlwq1ZToSsg0sr6rHhPMf5qcT"
  end
  NiceMessageUpdater.refresh_every = 60
  NiceMessageUpdater.search_limit = 100
  NiceMessageUpdater.max_messages = 100
  NiceMessageUpdater.search_terms = '"You are" OR "You\'re"'

end
