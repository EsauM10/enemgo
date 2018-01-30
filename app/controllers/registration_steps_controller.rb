class RegistrationStepsController < ApplicationController
  include Wicked::Wizard::Translated
  before_action :set_user, only: [:show, :update]
  steps :personal, :address, :confirmation

  def show
    case wizard_value(step)
    when 'address'
      skip_step
    end
    render_wizard
  end

  def update
    @user.update_attributes(user_params)
    render_wizard @user
  end

  def finish_wizard_path
    student_root_url
  end

  private
    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:username,
        profile_attributes: [:first_name, :last_name, :phone, :birthday, :avatar, :remove_avatar, :sex]
      )
    end
end
