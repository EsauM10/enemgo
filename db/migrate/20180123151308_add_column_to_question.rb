class AddColumnToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :official, :boolean, default: false
  end
end
