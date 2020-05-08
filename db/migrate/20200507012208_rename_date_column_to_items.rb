class RenameDateColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :date, :deli
  end
end
