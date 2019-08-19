class AddDateToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :rentalDate, :date
  end
end
