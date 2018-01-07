# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  price      :float
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plan < ApplicationRecord
  has_many :memberships

  validates :price, :name, presence: true
end
