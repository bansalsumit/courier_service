class CreateParcels < ActiveRecord::Migration[6.1]
  def change
    create_table :parcels do |t|
      t.decimal :weight, precision: 8, scale: 2
      t.string :status
      t.bigint :service_type_id
      t.string :payment_mode
      t.bigint :sender_id
      t.bigint :receiver_id
      t.decimal :cost, precision: 8, scale: 2

      t.timestamps
    end
    add_index :parcels, :service_type_id 
    add_index :parcels, :sender_id
    add_index :parcels, :receiver_id
  end
end
