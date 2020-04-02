class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :sentence, null: false
      t.integer :user_id, foreign_key: true, index: true
      t.integer :item_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
