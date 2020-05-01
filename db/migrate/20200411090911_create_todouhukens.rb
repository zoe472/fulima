class CreateTodouhukens < ActiveRecord::Migration[5.2]
  def change
    create_table :todouhukens do |t|
      t.integer :prefecture_id
      t.string :city

      t.timestamps
    end
  end
end
