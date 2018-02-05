class AddFieldsToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :status, :string
    add_column :subscriptions, :subscribed_at, :datetime
    add_column :subscriptions, :subscription_expires_at, :datetime
  end
end
