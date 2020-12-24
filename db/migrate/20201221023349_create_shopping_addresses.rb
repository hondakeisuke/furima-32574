class CreateShoppingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_addresses do |t|
      t.string :post_code,         null:false
      t.integer :prefecture_id,    null:false
      t.string :city,              null:false
      t.string :house_number,      null:false
      t.string :building_name,     null:false
      t.string :tell_number,       null:false
      t.references :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end