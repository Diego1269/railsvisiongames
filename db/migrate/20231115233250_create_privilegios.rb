class CreatePrivilegios < ActiveRecord::Migration[7.1]
  def change
    create_table :privilegios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
