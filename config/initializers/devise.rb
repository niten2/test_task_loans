Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.authentication_keys = [:login]
  config.case_insensitive_keys = [:login]
  config.strip_whitespace_keys = [:login]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 2..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.lock_strategy = :failed_attempts
  config.maximum_attempts = 4

  # config.unlock_keys = [ :time ]
  # config.unlock_strategy = :time
  # config.unlock_in = 2.hours

end
