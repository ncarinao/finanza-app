class CreateTransaccions < ActiveRecord::Migration[6.0]
  def change
    create_table :transaccions do |t|
      t.string :tipo_de_registro
      t.string :id_transaccion
      t.string :monto
      t.string :tipo
      t.references :cliente
      t.timestamps
    end
  end
end
