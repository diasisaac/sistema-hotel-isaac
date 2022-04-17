class CreateFuncionarios < ActiveRecord::Migration[7.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.integer :cpf
      t.string :email
      t.string :cargo

      t.timestamps
    end
  end
end
