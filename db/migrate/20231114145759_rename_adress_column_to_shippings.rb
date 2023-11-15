class RenameAdressColumnToShippings < ActiveRecord::Migration[7.0]
  def change
    rename_column :shippings, :adress, :address
  end
end
