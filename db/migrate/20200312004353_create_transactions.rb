class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.string :coin_name
      t.integer :user_id

      t.timestamps
    end
  end
end
