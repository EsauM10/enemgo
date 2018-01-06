# == Schema Information
#
# Table name: solutions
#
#  id          :integer          not null, primary key
#  statement   :text
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_solutions_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#

require 'rails_helper'

RSpec.describe Solution, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
