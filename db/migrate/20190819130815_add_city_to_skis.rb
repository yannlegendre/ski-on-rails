class AddCityToSkis < ActiveRecord::Migration[5.2]
  def change
    add_column :skis, :city, :string
  end
end
