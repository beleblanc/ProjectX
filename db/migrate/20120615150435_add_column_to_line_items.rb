class AddColumnToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :description, :string
  end
end
