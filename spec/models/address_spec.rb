# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  state      :string
#  city       :string
#  cep        :string
#  district   :string
#  street     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
