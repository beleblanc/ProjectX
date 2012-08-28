class AddIdFieldToRelations < ActiveRecord::Migration
  def change
    change_column :dependencies, :id, :primary_key
  end
end
