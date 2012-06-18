class RenameColumnInLineItem < ActiveRecord::Migration
  def change
    rename_column :line_items, :price_id, :price
  end


end
