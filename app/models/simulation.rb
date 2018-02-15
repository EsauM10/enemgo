# == Schema Information
#
# Table name: simulations
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  user_id    :integer
#  score      :float
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("doing")
#
# Indexes
#
#  index_simulations_on_exam_id  (exam_id)
#  index_simulations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#  fk_rails_...  (user_id => users.id)
#

class Simulation < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :questions, through: :exam
  has_many :simulation_answers

  enum status: [:doing, :finished]

  validates :user, :exam, presence: true

  before_save :finalize,
    if: Proc.new { |simulation| simulation.doing? && simulation.time_expired? }

  def finalize(end_time = expires_at)
    self.end_time = end_time
    self.status = :finished
    self.score = calc_score
  end

  def expires_at
    self.start_time + 4.hours
  end

  def time_expired?
    (expires_at - Time.now).to_i <= 0
  end

  def performance
    ((questions_where_veracity(true).to_f / total_questions) * 100)
  end

  def questions_where_veracity(correct)
    calc_score(correct)
  end

  def hits
    hits = {}
    area = %i[math human_sciences languages natural_sciences]

    answers = simulation_answers.joins(:alternative, :question)
                              .select('questions.area', 'count(alternatives.veracity) AS hits_count')
                              .where('alternatives.veracity = true').group('questions.area')

    answers.each do |a| hits.merge!({area[a.area] => a.hits_count}) end
    hits
  end

  private
    def calc_score(correct = true)
      answers = simulation_answers.includes(:alternative)
      answers.map { |a| a.alternative.veracity? }.count(correct)
    end

    def total_questions
      exam.questions.count
    end

end
