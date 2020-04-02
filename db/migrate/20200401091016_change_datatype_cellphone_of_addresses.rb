class ChangeDatatypeCellphoneOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :cellphone, :string
  end
end
