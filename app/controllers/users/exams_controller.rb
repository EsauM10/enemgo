class Users::ExamsController < ApplicationController
  layout 'dashboard'
  before_action :set_exam, except: [:index, :create, :new]
  before_action :authorize_exam, except: [:index, :create, :new]
  decorates_assigned :exam, :exams
  respond_to :html

  def index
    @exams = policy_scope(Exam).page(params[:page]).per(6)
  end

  def show
    #code
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(permitted_attributes(Exam).merge(user: current_user))

    if @exam.save
      flash[:success] = 'Prova submetida com sucesso.'
      redirect_to exam_path(:admin, @exam)
    else
      render :new
    end
  end

  def generate
    # Question.active.order("RANDOM()").count
    # questions_per_area = Question.select(:id, :area).group_by(&:area)
    # questions_per_area area: params[:areas], official: params[:official]

    areas = params[:areas]
    kind = params[:kind_questions]

    @exam = current_user.exams.build

    set_questions = Question.active
                            .where(area: params[:areas], official: params[:kind_questions])
                            .select(:id, :area)
                            .group_by(&:area)

    set_questions.each do |k, v|
      v.sample(20).each do |question|
        @exam.exam_questions.build(question_id: question.id)
      end
    end

    if @exam.save
      redirect_to simulations_path(@exam)
    else
      redirect_to exams_path(current_user.module_kind), notice: 'Ocorreu um erro'
    end

  end

  private

    def set_exam
      @exam = Exam.find(params[:id])
    end

    def authorize_exam
      authorize @exam
    end

    def exams_params
      params.require(:exam)
            .permit(policy(@exam)
            .permitted_attributes)
            .merge(user: current_user)
    end
end
