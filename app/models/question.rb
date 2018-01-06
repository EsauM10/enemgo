class Question < ApplicationRecord
  belongs_to :user
  has_many :exam_questions
  has_many :exams, through: :exam_questions
  has_many :alternatives, dependent: :destroy
  has_one :solution, dependent: :destroy  
end
