class DashboardController < ApplicationController
  def index
    if current_user.is_student?
      render 'student/dashboard'
    else
      render 'admin/dashboard'
    end
  end
end
