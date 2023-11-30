class CreateProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :productos do |t|
      t.text :image_url
      t.text :nombre
      t.references :categoria, null: false, foreign_key: true
      t.text :descripcion
      t.float :precio
      t.text :region
      t.integer :cantidad_ventas
      t.boolean :status

      t.timestamps
    end
  end
end
