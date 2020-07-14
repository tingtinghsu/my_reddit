class Backstage::LinksController < ApplicationController
  before_action :admin_auth
  def index 
    @user = User.find(param[:user_id])
  end

  private
  def admin_auth
    redirect_to root_path unless current_user.present? && current_user.is_admin?
  end
end
