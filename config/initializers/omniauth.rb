if Rails.env.production?
  client_id     = ENV['OAUTH_GITHUB_CLIENT_ID']
  client_secret = ENV['OAUTH_GITHUB_CLIENT_SECRET']
else
  client_id     = '576f701805248d850c50'
  client_secret = '57d95cc84b3a9512b511d9fd1d782398d9bc845a'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, client_id, client_secret
end
