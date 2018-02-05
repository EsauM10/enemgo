class StripeController < ApplicationController
  protect_from_forgery except: :webhooks
  skip_before_action :authenticate_user!

  def webhooks
    begin
      event_json = JSON.parse(request.body.read)
      event = Stripe::Event.retrieve(event_json["id"])

      case event.type
      when 'customer.subscription.created'
        handle_success_subscription event.data.object
      when 'customer.subscription.deleted'
        handle_canceled_subscription event.data.object
      when 'customer.subscription.update'
        handle_updated_subscription event.data.object
      end
    rescue Exception => ex
      render json: {status: 422, error: "Webhook call failed"}
      return
    end
    render json: {status: 200}
  end

  private

    def handle_success_subscription(event)
      plan = Plan.find_by(stripe_id: event.plan.id)
      user = User.find_by(stripe_id: event.customer)

      user.build_subscription(
        stripe_id: event.id,
        plan_id: plan.id,
        status: event.status,
        subscribed_at: Time.at(event.current_period_start).to_datetime,
        subscription_expires_at: Time.at(event.current_period_end).to_datetime
      )

      user.save
    end

    def handle_canceled_subscription(event)
      current_user.subscription.destroy
    end

    def handle_updated_subscription(event)
      plan = Plan.find_by(stripe_id: event.plan.id)
      user = User.find_by(stripe_id: event.customer)

      user.subscription.update_attributes(
        plan: plan,
        status: event.status,
        subscribed_at: Time.at(event.current_period_start).to_datetime,
        subscription_expires_at: Time.at(event.current_period_end).to_datetime
      )
    end

end
