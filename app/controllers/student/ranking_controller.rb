class Student::RankingController < Student::BaseController
  def index
    @students = Kaminari.paginate_array(User.students.decorate.sort_by(&:score))
                        .page(params[:page]).per(10)

  end
end
