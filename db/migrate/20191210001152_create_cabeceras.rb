class CreateCabeceras < ActiveRecord::Migration[6.0]
  def change
    create_table :cabeceras do |t|
      t.string :tipo_de_registro
      t.string :id_pago
      t.string :moneda
      t.string :monto_total
      t.string :total_con_descuentos
      t.references :cliente
      t.timestamps
    end
  end
end
