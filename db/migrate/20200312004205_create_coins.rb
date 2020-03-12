class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.string :name
      t.integer :value
      t.integer :amount

      t.timestamps
    end
  end
end
