# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  price      :float
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stripe_id  :string
#  slug       :string
#

require 'rails_helper'

RSpec.describe Plan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
