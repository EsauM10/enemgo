class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception, prepend: true
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  helper_method :current_simulation

  protected

    def current_user
      super&.decorate
    end

    def paper_trail_enabled_for_controller
      user_signed_in? && current_user.admin?
    end

    def after_sign_in_path_for(resource)
      send("#{current_user.module_kind}_root_url")
    end

    # should be rewritten
    def current_simulation
      simulation ||= session[:simulation_id] ? Simulation.find(session[:simulation_id]) : current_user.simulations.last

      return nil if simulation.nil? || simulation.finished?

      if simulation.time_expired?
        session[:simulation_id] = nil
        simulation.save
        nil
      else
        session[:simulation_id] = simulation.id
        simulation
      end
    end

  private

    def user_not_authorized
      flash[:alert] = 'Você não tem permissões para executar esta ação.'
      redirect_to(request.referrer || send("#{current_user.module_kind}_root_path"))
    end
end
