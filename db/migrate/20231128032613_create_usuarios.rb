class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.string :name
      t.string :email
      t.text :picture
      t.references :privilegio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
