class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,        null: false
      t.text :description,   null: false
      t.string :size
      t.string :status,      null: false
      t.string :charge,     null: false
      t.string :region,      null: false
      t.integer :price,      null: false
      t.string :date,       null: false
      t.integer :seller_id,  foreign_key: true
      t.integer :buyer_id,   foreign_key: true
      t.integer :brand_id,   foreign_key: true
      t.timestamps
    end
  end
end
