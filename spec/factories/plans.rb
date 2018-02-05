# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  price      :float
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stripe_id  :string
#  slug       :string
#

FactoryBot.define do
  factory :plan do
    value 1.5
    name "MyString"
  end
end
