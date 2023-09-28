class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line_one, null: false
      t.string :address_line_two
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :pincode, null: false
      t.string :mobile_number, null: false
      t.bigint :user_id

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
