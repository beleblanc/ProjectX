class RenamePeopleIdColumn < ActiveRecord::Migration
  def up
    rename_column :wait_lists, :people_id, :person_id
  end

  def down
  end
end
