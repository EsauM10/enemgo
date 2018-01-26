class RemoveAnswerListAndAddSimulationFromSimulationAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :simulation_answers, :answer_list, foreign_key: true
    add_reference :simulation_answers, :simulation, foreign_key: true
  end
end
