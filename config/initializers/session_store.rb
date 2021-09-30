if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'https://www.owarai-judge.com', expire_after: 3.years
else
  Rails.application.config.session_store :cookie_store, key: '_auth-app-api'
end