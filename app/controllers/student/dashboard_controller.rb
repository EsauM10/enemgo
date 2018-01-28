class Student::DashboardController < Student::BaseController
  def index
    @students = User.students
    @students[0..4]
  end
end
