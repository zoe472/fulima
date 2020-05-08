class RenameDatesColumnToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :date, :string
  end
end
