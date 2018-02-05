# == Schema Information
#
# Table name: options_plans
#
#  id         :integer          not null, primary key
#  plan_id    :integer
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_options_plans_on_plan_id  (plan_id)
#
# Foreign Keys
#
#  fk_rails_...  (plan_id => plans.id)
#

require 'rails_helper'

RSpec.describe OptionsPlan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
