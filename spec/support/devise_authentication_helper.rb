module DeviseAuthenticationHelper
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = Fabricate(:user)
    sign_in @user
  end
end
