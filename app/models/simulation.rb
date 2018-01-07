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

class Simulation < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_one :answerlist

  validates :user, :exam, presence: true
end
