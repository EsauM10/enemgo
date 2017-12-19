class Student::BaseController < ApplicationController
  layout 'dashboard'
  before_action :authorize_only_student

  private

  def authorize_only_student
    redirect_to admin_root_path unless current_user.student?
  end
end
