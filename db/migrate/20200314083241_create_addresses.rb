class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :familyname,         null: false
      t.string :name,               null: false
      t.string :kana_familyname,    null: false
      t.string :kana_name,          null: false
      t.integer :postalcode,        null: false
      t.string :prefecture,         null: false
      t.string :city,               null: false
      t.string :address,            null: false
      t.string :apartment
      t.integer :cellphone
      t.references :user,           foreign_key: true

      t.timestamps
    end
  end
end
