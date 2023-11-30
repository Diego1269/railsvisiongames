class CreateVenta < ActiveRecord::Migration[7.1]
  def change
    create_table :venta do |t|
      t.text :numero_transaccion
      t.references :usuario, null: false, foreign_key: true
      t.float :total_venta

      t.timestamps
    end
  end
end
