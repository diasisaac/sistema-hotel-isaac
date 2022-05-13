class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :capacity
      t.float :price
      t.text :detail

      t.timestamps
    end
  end
end
