class Student::SimulationAnswersController < Student::BaseController
  before_action :set_simulation_answer, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def create
    @simulation_answer = SimulationAnswer.new(simulation_answer_params)

    if @simulation_answer.save
      flash[:success] = "Resposta enviada com sucesso"
    else
      flash[:error] = "Erro ao enviar resposta"
    end

  end

  def update
    if @simulation_answer.update(simulation_answer_params)
      flash[:success] = "Sua resposta foi alterada"
    else
      flash[:error] = "Erro ao alterar sua resposta"
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation_answer
      @simulation_answer = SimulationAnswer.find(params[:id])
    end

    def simulation_answer_params
      params.require(:simulation_answer)
            .permit(:alternative_id)
            .merge(
              user_id: current_user.id,
              question_id: params[:question_id],
              simulation_id: params[:simulation_id]
            )
    end
end
