class CreateOptionsPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :options_plans do |t|
      t.references :plan, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
