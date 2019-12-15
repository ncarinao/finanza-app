class CreateDescuentos < ActiveRecord::Migration[6.0]
  def change
    create_table :descuentos do |t|
      t.string :tipo_de_registro
      t.string :id_descuento, primary: true
      t.string :monto
      t.string :tipo
      t.references :cliente
      t.timestamps
    end
  end
end
