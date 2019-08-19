class CreateSkis < ActiveRecord::Migration[5.2]
  def change
    create_table :skis do |t|
      t.string :photo
      t.integer :price
      t.integer :taille
      t.string :model
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
