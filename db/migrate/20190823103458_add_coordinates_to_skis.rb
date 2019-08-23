class AddCoordinatesToSkis < ActiveRecord::Migration[5.2]
  def change
    add_column :skis, :latitude, :float
    add_column :skis, :longitude, :float
  end
end
