class RecreatePersonRelations < ActiveRecord::Migration
  def up
    drop_table :person_relations


  end

  def down
  end
end
