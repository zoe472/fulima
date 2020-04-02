class CreateCategoryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :category_items do |t|
      t.integer :item_id, foreign_key: true, index: true
      t.integer :category_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
