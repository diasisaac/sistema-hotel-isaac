class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.references :quarto, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true
      t.date :check_in
      t.date :checkout
      t.integer :numero_adultos
      t.integer :numero_criancas
      t.text :pedidos

      t.timestamps
    end
  end
end
