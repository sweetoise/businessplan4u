class ProfilePagesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_allow_admins
  before_action :set_user, only: [:index, :show, :edit, :change_password, :update]

  layout 'adminpanel_tables'
  def index
  end

  def edit
  end

  def change_password
    if @user.update(user_params)
      sign_in(@user, bypass: true)
      if @user.save and (@user.has_role? :superadmin or @user.has_role? :admin_user)
        flash[:notice] = "User Account Successfully Updated"
        redirect_to root_path
      else
      end
    else
      flash[:error] = "There was an error updating your Password. Check details below and please try again"
      render 'show'
    end
  end

  def show
  end

  private

  def only_allow_admins
    redirect_to root_path, :alert => 'Not authorized as an superadministrator.' unless current_user.has_role? :superadmin or current_user.has_role? :admin_user or current_user.has_role? :library_admin or current_user.has_role? :class_note_admin or current_user.has_role? :past_questions_admin or current_user.has_role? :voucher_admin
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :photo, :avatar)
  end
end
