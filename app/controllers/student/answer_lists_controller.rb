class Student::AnswerListsController < Student::BaseController

  def show
    @simulation = Simulation.find(params[:id])
    @simulation.answer_list.includes(:response_answers)
  end

end
