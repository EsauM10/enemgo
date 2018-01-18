class AddTitleToExams < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :title, :string
  end
end
