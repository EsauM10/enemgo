class Student::SubscriptionsController < Student::BaseController
  protect_from_forgery except: :create

  def show
    #code
  end

  def new
    @plan = Plan.friendly.find(params[:plan_id])
    @subscription = current_user.build_subscription(plan: @plan)
  end

  def create
    @plan = Plan.friendly.find(params[:plan_id])
    puts params[:stripeToken]
    begin
      customer =
        if current_user.stripe_id?
          Stripe::Customer.retrieve(current_user.stripe_id)
        else
          cs = Stripe::Customer.create(email: current_user.email)
          current_user.stripe_id = cs.id
          cs
        end

      subscription = customer.subscriptions.create(
        source: params[:stripeToken],
        plan: @plan.stripe_id
      )

      current_user.save
      flash[:notice] = "Parabéns! Você agora é um usuário Premium"
    rescue Stripe::CardError => e
      @plan.errors.add :credit_card, e.message
    end

    redirect_to student_root_path
  end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(
      current_user.subscription.stripe_id
    ).delete(at_period_end: true)

    redirect_to student_root_path, notice: "Sua inscrição foi cancelada."
  end
end
