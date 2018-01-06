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

require 'rails_helper'

RSpec.describe AnswerList, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
