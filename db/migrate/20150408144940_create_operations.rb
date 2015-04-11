class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :cuenta_destino
      t.string :cuenta_origen
      t.string :tipo_de_pago
      t.string :tipo_de_operacion
      t.integer :monto_operation
      t.references :client, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
