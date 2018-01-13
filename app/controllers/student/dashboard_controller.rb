class Student::DashboardController < Student::BaseController
  def index
    @students = User.all.sort_by(&:score)
  end
end
