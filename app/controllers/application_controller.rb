class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!

  protected

    def paper_trail_enabled_for_controller
      user_signed_in? && current_user.admin?
    end
end
