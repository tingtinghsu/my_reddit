class Backstage::LinksController < ApplicationController
  before_action :admin_auth
  def index 
    @user = User.find(params[:user_id])
    @links = @user.links 
  end

  def destroy
    @link = Link.find(params[:id])
    @link.delete!
    redirect_to backstage_user_links_path(params[:user_id])
  end

  private
  def admin_auth
    redirect_to root_path unless current_user.present? && current_user.is_admin?
  end
end
