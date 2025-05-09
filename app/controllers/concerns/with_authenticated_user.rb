module WithAuthenticatedUser
  extend ActiveSupport::Concern

  included do
    before_action :inject
  end

  private

  def inject
    @user = User.find_by_auth0_sub(session[:userinfo]["sub"])
  rescue
    @user = nil
  end
end