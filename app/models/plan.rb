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

class Plan < ApplicationRecord
  has_many :subscriptions
  has_many :options_plans, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates :price, :name, presence: true
  validates_uniqueness_of :name, :stripe_id

  accepts_nested_attributes_for :options_plans, allow_destroy: true
end
