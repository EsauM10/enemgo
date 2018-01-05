class CreateAnswerLists < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_lists do |t|
      t.references :simulation, foreign_key: true
      
      t.timestamps
    end
  end
end
