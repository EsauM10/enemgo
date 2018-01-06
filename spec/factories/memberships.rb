# == Schema Information
#
# Table name: memberships
#
#  id          :integer          not null, primary key
#  start_date  :date
#  expire_date :date
#  user_id     :integer
#  plan_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_memberships_on_plan_id  (plan_id)
#  index_memberships_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_id => plans.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :membership do
    start_date "2017-12-07"
    expire_date "2017-12-07"
    user nil
    plan nil
  end
end
