FeelGood::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure static asset server for tests with Cache-Control for performance.
  config.serve_static_assets  = true
  config.static_cache_control = "public, max-age=3600"

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  redis = Redis.new

  NiceMessages.redis = redis
  NiceMessageUpdater.redis = redis

  NiceMessages.redis_wordlist_key = "test-nice-words"
  NiceMessageUpdater.update_needed_key = "test-words-fresh"

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
