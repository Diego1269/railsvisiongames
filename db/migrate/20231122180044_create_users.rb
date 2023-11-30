class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.text :nombre_completo
      t.string :correo
      t.string :password_digest
      t.string :telefono
      t.references :privilegio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
