class RenameWaitListIdInWaitLists < ActiveRecord::Migration
  def up
    rename_column :consultations, :wait_list_id, :person_id
  end

  def down
    rename_column :consultations, :person_id, :wait_list_id
  end
end
