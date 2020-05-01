class AddReferencesToPictures < ActiveRecord::Migration[5.2]
  def change
    add_reference :pictures, :item, foreign_key: true
  end
end
