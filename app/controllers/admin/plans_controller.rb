class Admin::PlansController < Admin::BaseController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def edit
  end

  def create
    amount = plan_params[:price].to_f > 0 ? plan_params[:price].to_f * 100 : 0
    to_stripe = params[:stripe] == true

    if to_stripe
      plan = Stripe::Plan.create(
        amount: amount,
        interval: 'month',
        name: plan_params[:name],
        currency: 'brl',
        id: Plan.maximum(:id).next
      )
      @plan = Plan.new(
        name: plan.name,
        options: plan_params[:options],
        price: plan_params[:price].to_f,
        stripe_id: plan.id
      )
    else
      @plan = Plan.new(plan_params)
    end

    if @plan.save
      redirect_to [:admin, @plan], notice: 'Plano criado com sucesso.'
    else
      to_stripe ? plan.delete : nil
      render :new
    end

  end

  def update
    if @plan.update(plan_params)
      redirect_to [:admin, @plan], notice: 'Plan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @plan.stripe_id?
      Stripe::Plan.retrieve(@plan.stripe_id).delete
    end

    @plan.destroy

    redirect_to admin_plans_url, notice: 'Plan was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(
        :price, :name, :stripe,
        options_plans_attributes: [:id, :text, :_destroy]
      )
    end
end
