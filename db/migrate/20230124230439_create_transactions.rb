class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.string :action
      t.integer :value
      t.string :description

      t.timestamps
    end

    add_reference :transactions, :user, foreign_key: true
  end
end
