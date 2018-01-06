# == Schema Information
#
# Table name: memberships
#
#  id          :integer          not null, primary key
#  start_date  :date
#  expire_date :date
#  user_id     :integer
#  plan_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_memberships_on_plan_id  (plan_id)
#  index_memberships_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_id => plans.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Membership, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
