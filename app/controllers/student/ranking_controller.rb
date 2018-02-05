class Student::RankingController < Student::BaseController
  def index
    @students = Kaminari.paginate_array(User.students).page(params[:page]).per(10)
  end
end
