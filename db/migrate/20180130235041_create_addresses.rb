class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :state
      t.string :city
      t.string :cep
      t.string :district
      t.string :street
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
