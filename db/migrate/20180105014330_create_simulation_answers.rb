class CreateSimulationAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :simulation_answers do |t|
      t.references :answer_list, foreign_key: true
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.references :alternative, foreign_key: true

      t.timestamps
    end
  end
end
