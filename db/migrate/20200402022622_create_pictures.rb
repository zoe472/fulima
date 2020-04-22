class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.timestamps
      t.string :image, null: false
      t.references :item, foreign_key: true
    end
  end
end
