# == Schema Information
#
# Table name: subscriptions
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  plan_id                 :integer
#  stripe_id               :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  status                  :string
#  subscribed_at           :datetime
#  subscription_expires_at :datetime
#
# Indexes
#
#  index_subscriptions_on_plan_id  (plan_id)
#  index_subscriptions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_id => plans.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
