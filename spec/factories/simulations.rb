# == Schema Information
#
# Table name: simulations
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  user_id    :integer
#  score      :float
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("doing")
#
# Indexes
#
#  index_simulations_on_exam_id  (exam_id)
#  index_simulations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :simulation do
    start_time "2017-12-07 21:57:27"
    end_time "2017-12-07 21:57:27"
    user nil
    score 1.5
    exam nil
  end
end
