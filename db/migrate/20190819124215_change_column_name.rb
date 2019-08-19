class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :skis, :taille, :size
  end
end
