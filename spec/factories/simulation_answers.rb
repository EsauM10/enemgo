# == Schema Information
#
# Table name: simulation_answers
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  question_id    :integer
#  alternative_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  simulation_id  :integer
#
# Indexes
#
#  index_simulation_answers_on_alternative_id  (alternative_id)
#  index_simulation_answers_on_question_id     (question_id)
#  index_simulation_answers_on_simulation_id   (simulation_id)
#  index_simulation_answers_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (alternative_id => alternatives.id)
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (simulation_id => simulations.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :simulation_answer do
    answerlist nil
    user nil
    question nil
    alternative nil
  end
end
