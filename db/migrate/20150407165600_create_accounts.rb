class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :numero_de_cuenta
      t.string :tipo_de_cuenta
      t.integer :monto
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
