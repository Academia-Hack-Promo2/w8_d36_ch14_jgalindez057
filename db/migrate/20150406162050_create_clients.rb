class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t| 
      t.string :name
      t.string :last_name
      t.integer :identify
      t.string :address
      t.integer :local_phone
      t.integer :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
