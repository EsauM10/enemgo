class AddStatusToSimulation < ActiveRecord::Migration[5.1]
  def change
    add_column :simulations, :status, :integer, default: 0
  end
end
