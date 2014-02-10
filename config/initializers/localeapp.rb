require 'localeapp/rails'

Localeapp.configure do |config|
  config.api_key = 'VF1zPO7j7ZjFY4ED71HP8gJqA8a0GWrsRBe6jZXaeTieKHcav5'
  config.poll_interval = 60
  config.polling_environments = [:staging]
  config.reloading_environments = [:development, :staging]
  config.sending_environments = []
end
