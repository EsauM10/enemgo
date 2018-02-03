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

FactoryBot.define do
  factory :address do
    state 1
    city "MyString"
    cep "MyString"
    district "MyString"
    street "MyString"
    user nil
  end
end
