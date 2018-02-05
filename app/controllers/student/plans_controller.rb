class Student::PlansController < Student::BaseController
  def index
    @plans = Plan.all
  end
end
