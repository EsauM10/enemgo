class AddSexToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :sex, :string
  end
end
