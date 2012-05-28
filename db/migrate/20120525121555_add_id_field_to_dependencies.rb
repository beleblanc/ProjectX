class AddIdFieldToDependencies < ActiveRecord::Migration
  def change
    add_column :dependencies, :id, :integer
  end
end
