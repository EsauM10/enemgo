# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  statement  :text
#  status     :integer
#  source     :string
#  user_id    :integer
#  area       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Question < ApplicationRecord
  belongs_to :user
  has_many :exam_questions
  has_many :exams, through: :exam_questions
  has_many :alternatives, dependent: :destroy
  has_one :solution, dependent: :destroy

  validates :user, :statement, :area, presence: true
  validates :alternatives, length: { is: 5,
    wrong_length: "não possui a quantidade mínima, deve ter #{count}" }

  validates_with QuestionAlternativesValidator

  accepts_nested_attributes_for :alternatives
  accepts_nested_attributes_for :solution

  enum area: %i[math human_sciences languages natural_sciences]
  enum status: %i[pending rejected approved inactive]

  scope :active, -> { where.not(status: :inactive).includes(:alternatives) }
end
