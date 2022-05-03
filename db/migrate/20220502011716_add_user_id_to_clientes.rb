class AddUserIdToClientes < ActiveRecord::Migration[7.0]
  def change
    add_column :clientes, :usuario_id, :integer
  end
end
