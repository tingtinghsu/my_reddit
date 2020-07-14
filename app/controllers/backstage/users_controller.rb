class Backstage::UsersController < ApplicationController
  before_action :admin_auth
  def index 
    @users = User.all
  end

  private
  def admin_auth
    redirect_to root_path unless current_user.present? && current_user.is_admin?
  end
end