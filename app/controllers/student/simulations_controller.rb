class Student::SimulationsController < Student::BaseController
  layout Proc.new { |controller| controller.action_name == 'answering' ? 'answer_simulation' : 'dashboard' }
  before_action :set_simulation, only: [:show, :answering, :finished, :answer_list]
  before_action :authorize_simulation, except: [:index, :new, :create]
  respond_to :html, :js
  decorates_assigned :simulation, :simulations

  def index
    @simulations = Simulation.where(user: current_user, status: :finished)
                             .includes(:exam)
                             .page(params[:page])
                             .per(8)
  end

  def new
    @exam = Exam.find(params[:exam_id])
  end

  def show
  end

  def create
    if current_simulation
      redirect_to exams_path, notice: 'Você já está realizando um simulado'
    else
      @exam = Exam.find(params[:exam_id])

      @simulation = @exam.simulations.build(
        user: current_user,
        start_time: Time.now,
        score: 0.0
      )

      if @simulation.save
        session[:simulation_id] = @simulation.id
        redirect_to answering_student_simulation_url(@simulation)
      else
        redirect_to exams_path, notice: 'Ocorreu um erro, simulado não gerado'
      end
    end

  end

  def answering
    @questions = @simulation.questions
                            .includes(:alternatives)
                            .page(params[:current_question] || 1)
                            .per(1)
    if @questions
      @question = @questions.take.decorate

      options = {
        user_id: current_user.id,
        question_id: @question.id,
        simulation_id: @simulation.id
      }

      @simulation_answer = SimulationAnswer.where(options).first_or_initialize

    else
      redirect_to :back, notice: 'Essa questão não existe neste simulado'
    end

  end

  def finished
    @simulation.finalize Time.now
    @simulation.save
    session[:simulation_id] = nil
    redirect_to exams_path(:student), flash: {success: "Parabéns, você finalizou o simulado em #{@simulation.decorate.time_spent}"}
  end

  def answer_list
    @answers = @simulation.simulation_answers
    @questions_ids = @simulation.question_ids
  end

  private

    def set_simulation
      if current_simulation
        @simulation = current_simulation
      else
        @simulation = Simulation.find(params[:id])
      end
    end

    def authorize_simulation
      authorize @simulation
    end

    def simulation_params
      params.require(:simulation).permit(:exam_id, :current_question)
    end
end
