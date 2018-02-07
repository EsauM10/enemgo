class Student::DashboardController < Student::BaseController
  def index
    @students = User.students.limit(5).decorate.sort_by(&:score)
  end
end
