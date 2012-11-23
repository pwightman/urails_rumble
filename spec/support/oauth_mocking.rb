module OauthMocking
  def login_with_oauth(provider = :github)
    visit "/auth/#{provider}"
  end

  def set_auth_headers
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end

  def omniauth_user
    @omniauth_user ||= User.find_or_create_by_uid_and_provider(OmniAuth.config.mock_auth[:github][:uid], :github)
  end
end
