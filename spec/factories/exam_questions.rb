# == Schema Information
#
# Table name: exam_questions
#
#  id          :integer          not null, primary key
#  exam_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_exam_questions_on_exam_id      (exam_id)
#  index_exam_questions_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#  fk_rails_...  (question_id => questions.id)
#

FactoryBot.define do
  factory :exam_question do
    exam ""
    question nil
  end
end
