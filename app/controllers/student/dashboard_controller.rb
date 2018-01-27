class Student::DashboardController < Student::BaseController
  def index
    @students = User.where(kind: :student).decorate.sort_by(&:score)
    @students[0..4]
  end
end
