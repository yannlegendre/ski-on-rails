class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :ski, foreign_key: true
      t.references :customer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
