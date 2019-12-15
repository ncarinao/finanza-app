class CreateFooters < ActiveRecord::Migration[6.0]
  def change
    create_table :footers do |t|
      t.string :tipo_de_registro
      t.string :fecha_de_pago
      t.references :cliente
      t.timestamps
    end
  end
end
