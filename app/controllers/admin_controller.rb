class AdminController < ApplicationController
  before_action :authorize, :authorize_admin

  private

  def authorize_admin
    unless current_user.admin?
      flash[:alert] = 'You are not logged in as an administrator. '\
                      'Please Log In to Proceed'
      redirect_to signin_sessions_url
    end
  end
end
