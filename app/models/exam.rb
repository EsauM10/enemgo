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

  accepts_nested_attributes_for :questions

  has_paper_trail if: Proc.new { |t| t.user.admin? }

  enum kind: [:enem, :customized]

  validates :title, :year, presence: true
  # validates :kind, numericality: { only_integer: true }

  # before_create :set_defaults

  scope :official, -> { where(kind: :enem) }

  scope :custom, -> (user) do
    where(kind: :customized, user: user)
  end

  private

    def set_defaults
      self.kind = :customized
      self.year = Time.now.year
    end

end
