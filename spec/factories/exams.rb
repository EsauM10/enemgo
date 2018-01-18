# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  year       :integer
#  kind       :integer
#  status     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#
# Indexes
#
#  index_exams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :exam do
    year 1
    kind 1
    status 1
    user nil
  end
end
