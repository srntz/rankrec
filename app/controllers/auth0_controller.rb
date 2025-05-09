class Auth0Controller < ApplicationController
  def callback
    auth_info = request.env["omniauth.auth"]
    raw_info = auth_info["extra"]["raw_info"]
    session[:userinfo] = raw_info
    User.create(username: raw_info["nickname"], auth0_sub: raw_info["sub"], role: :user) unless User.exists?(auth0_sub: raw_info["sub"])
    redirect_to "/"
  end

  def failure
    @error_msg = request.params['message']
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private
  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: ENV["AUTH0_CLIENT_ID"]
    }

    URI::HTTPS.build(host: ENV["AUTH0_DOMAIN"], path: '/v2/logout', query: to_query(request_params)).to_s
  end

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end
end
