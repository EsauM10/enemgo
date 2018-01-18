# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  theme      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :contact do
    name "MyString"
    email "MyString"
    theme "MyString"
    message "MyText"
  end
end
