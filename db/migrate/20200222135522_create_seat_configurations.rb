class CreateSeatConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :seat_configurations do |t|
      t.string :category
      t.integer :seat_in_row
      t.integer :no_of_rows
      t.float :price
      t.references :flight, foreign_key: true

      t.timestamps
    end
  end
end
