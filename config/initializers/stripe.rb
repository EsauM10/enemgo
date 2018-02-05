Rails.configuration.stripe = {
  publishable_key:  ENV['STR_PUBLISHABLE_KEY'],
  secret_key:       ENV['STR_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
