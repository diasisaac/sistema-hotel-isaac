class CreateQuartos < ActiveRecord::Migration[7.0]
  def change
    create_table :quartos do |t|
      t.string :nome
      t.integer :andar
      t.float :diaria
      t.integer :capacidade
      t.text :descricao

      t.timestamps
    end
  end
end
