class AddDateToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :rental_date, :date
  end
end
