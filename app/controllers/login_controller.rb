class LoginController < Devise::SessionsController
  before_action :configure_permitted_parameters
  
  
  layout 'admin_login'
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:login, :password, :remember_me)
    end
  end

end
