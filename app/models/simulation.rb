class Simulation < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_one :answerlist
end
