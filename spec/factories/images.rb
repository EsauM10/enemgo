# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  source         :string
#  imageable_type :string
#  imageable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_images_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#

FactoryBot.define do
  factory :image do
    source "MyString"
    imageable nil
  end
end
