class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.integer :user_id, foreign_key: true
      t.integer :item_id, foreign_key: true

      t.timestamps
    end
  end
end
