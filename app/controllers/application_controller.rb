class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!
  # decorates_assigned :user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

    def current_user
      super&.decorate
    end

    def paper_trail_enabled_for_controller
      user_signed_in? && current_user.admin?
    end

  private

    def user_not_authorized
      flash[:alert] = 'Você não tem permissões para executar esta ação.'
      redirect_to(request.referrer || root_path)
    end
end
