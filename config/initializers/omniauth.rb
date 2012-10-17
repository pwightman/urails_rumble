Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, '576f701805248d850c50', '57d95cc84b3a9512b511d9fd1d782398d9bc845a'
  provider :twitter, 'd3cq4ua7q5DwAC65c5EYw', 'O89Epq4jyGoFi3qwj2M582awKI7BZ7x5XoGP915IIyE'

end
