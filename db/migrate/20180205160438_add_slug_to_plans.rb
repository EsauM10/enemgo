class AddSlugToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :slug, :string
  end
end
