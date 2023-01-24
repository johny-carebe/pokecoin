class AddBitcoinsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bitcoins, :integer, null: false, default: 0
  end
end
