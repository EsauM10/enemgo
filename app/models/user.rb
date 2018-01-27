# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  kind                   :integer          default("student")
#  username               :string
#  provider               :string
#  uid                    :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  has_one :profile, dependent: :destroy
  has_one :membership
  has_many :exams
  has_many :simulations
  has_many :simulation_answers

  accepts_nested_attributes_for :profile

  enum kind: %i[student evaluator admin]

  scope :students, -> { where(kind: :student).decorate.sort_by(&:score) }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.build_profile(first_name: auth.info.name)
    end
  end

  after_create :default_profile

  def default_profile
    prof = Profile.new(user_id: self.id)
    prof.save(validate: false)
  end

  def score
    scores = simulations.collect {|s| s.score}
    sum = scores.reduce(:+)
    if sum.nil? then 0 else (sum / scores.size.to_f) end
  end

end
