# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  statement  :text
#  status     :integer          default("pending")
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

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
