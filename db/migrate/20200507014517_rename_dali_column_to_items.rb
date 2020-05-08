class RenameDaliColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :deli, :date
  end
end
