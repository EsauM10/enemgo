class Admin::BaseController < ApplicationController
  layout 'dashboard'
  before_action :authorize_admin!
  before_action :set_paper_trail_whodunnit

  private

  def authorize_admin!
    redirect_to root_path if current_user.student?
  end

  def user_for_paper_trail
    user_signed_in? ? current_user.id : 'Guest User'
  end

end
