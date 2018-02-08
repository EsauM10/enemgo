class Users::QuestionsController < ApplicationController
  layout 'dashboard'
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  decorates_assigned :question, :questions

  def index
    if params[:filter]
      @filter = policy_scope(Question).where(status: params[:filter][:status])
    else
      @filter = policy_scope(Question)
    end
    @questions = @filter.order('created_at DESC').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @question = Question.new
    5.times { @question.alternatives.build }
    @question.build_solution
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_path(current_user.module_kind, @question),
          flash: { success: 'Questão submetida com sucesso.' } }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_path(current_user.kind),
          flash: { success: 'Questão atualizada com sucesso.'} }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    if question.exams.exists?
      @question.destroy
    else
      @question.update_attributes(status: :inactive)
    end
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'A Questão foi desabilitada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(
        :statement, :status, :source, :area,
        alternatives_attributes: [:id, :statement, :veracity],
        solution_attributes: [:id, :statement]
      ).merge(user: current_user)
    end
end
