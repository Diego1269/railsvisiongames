class CreateDetalleVenta < ActiveRecord::Migration[7.1]
  def change
    create_table :detalle_venta do |t|
      t.text :numero_transaccion
      t.references :producto, null: false, foreign_key: true
      t.float :cantidad
      t.float :precio
      t.float :total_venta

      t.timestamps
    end
  end
end
