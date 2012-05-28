class DropRelationType < ActiveRecord::Migration
  def up
    drop_table :relation_types
  end

  def down
  end
end
