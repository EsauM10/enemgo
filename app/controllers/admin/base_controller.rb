class Admin::BaseController < ApplicationController
  layout 'dashboard'
  before_action :authorize_admin!


  private

  def authorize_admin!
    redirect_to root_path if current_user.student?
  end

end
