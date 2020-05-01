class RemoveChargeFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :charge, :string
  end
end
