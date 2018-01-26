# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  statement  :text
#  status     :integer
#  source     :string
#  user_id    :integer
#  area       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  official   :boolean          default(FALSE)
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :question do
    statement "MyText"
    status 1
    source "MyString"
    user nil
    area 1
  end
end
