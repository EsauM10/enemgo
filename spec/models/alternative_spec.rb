# == Schema Information
#
# Table name: alternatives
#
#  id          :integer          not null, primary key
#  statement   :text
#  question_id :integer
#  veracity    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_alternatives_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#

require 'rails_helper'

RSpec.describe Alternative, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
