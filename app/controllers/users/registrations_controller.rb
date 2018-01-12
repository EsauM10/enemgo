class Users::RegistrationsController < Devise::RegistrationsController
  layout 'dashboard', only: :edit

  protected

    def after_sign_up_path_for(resource)
      registration_steps_path
    end

    def after_update_path_for(resource)
      registration_steps_path
    end
end
