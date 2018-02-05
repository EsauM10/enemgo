# == Schema Information
#
# Table name: options_plans
#
#  id         :integer          not null, primary key
#  plan_id    :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_options_plans_on_plan_id  (plan_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_id => plans.id)
#

FactoryBot.define do
  factory :options_plan do
    plan nil
    text "MyString"
  end
end
