class SimulationAnswer < ApplicationRecord
  belongs_to :answerlist
  belongs_to :user
  belongs_to :question
  belongs_to :alternative
end
