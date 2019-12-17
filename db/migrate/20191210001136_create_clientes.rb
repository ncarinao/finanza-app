class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :codigo
      t.string :job
      t.string :country
      t.string :address
      t.string :zip_code
      t.string :phone

      t.timestamps
    end
  end
end
