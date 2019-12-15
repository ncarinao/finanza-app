class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :codigo
      t.timestamps
    end
  end
end
