class RegisterController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:update]
  before_action :configure_permitted_parameters

  def edit
    super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :current_password, :photo)
    end
  end

end
