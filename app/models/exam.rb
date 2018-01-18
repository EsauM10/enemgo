# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  year       :integer
#  kind       :integer
#  status     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#
# Indexes
#
#  index_exams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Exam < ApplicationRecord
  belongs_to :user
  has_many :exam_questions
  has_many :questions, through: :exam_questions
  has_many :simulations

  validates :user, :year, presence: true

  enum kind: [:enem, :customized]
end
