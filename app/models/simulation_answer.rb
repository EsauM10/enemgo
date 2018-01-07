# == Schema Information
#
# Table name: simulation_answers
#
#  id             :integer          not null, primary key
#  answer_list_id :integer
#  user_id        :integer
#  question_id    :integer
#  alternative_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_simulation_answers_on_alternative_id  (alternative_id)
#  index_simulation_answers_on_answer_list_id  (answer_list_id)
#  index_simulation_answers_on_question_id     (question_id)
#  index_simulation_answers_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (alternative_id => alternatives.id)
#  fk_rails_...  (answer_list_id => answer_lists.id)
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#

class SimulationAnswer < ApplicationRecord
  belongs_to :answerlist
  belongs_to :user
  belongs_to :question
  belongs_to :alternative

  validates :answerlist, :user, :question, :alternative, presence: true
end
