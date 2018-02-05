class Student::RankingController < Student::BaseController
  def index
    @students = User.students
  end
end
