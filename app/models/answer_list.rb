# == Schema Information
#
# Table name: answer_lists
#
#  id            :integer          not null, primary key
#  simulation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_answer_lists_on_simulation_id  (simulation_id)
#
# Foreign Keys
#
#  fk_rails_...  (simulation_id => simulations.id)
#

class AnswerList < ApplicationRecord
  belongs_to :simulation
end
