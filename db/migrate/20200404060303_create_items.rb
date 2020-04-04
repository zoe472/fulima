class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,        null: false
      t.text :description,   null: false
      t.string :size,        null: false
      t.string :status,      null: false
      t.integer :charge,     null: false
      t.string :region,      null: false
      t.integer :price,      null: false
      t.integer :date,       null: false
      t.integer :seller_id,  foreign_key: true
      t.integer :buyer_id,   foreign_key: true
      t.integer :brand_id,   foreign_key: true
      t.timestamps
    end
  end
end