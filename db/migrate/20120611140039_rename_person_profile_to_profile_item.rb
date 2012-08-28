class RenamePersonProfileToProfileItem < ActiveRecord::Migration
  def up
    rename_column :profile_sub_items, :person_profile_id, :profile_item_id
  end

  def down
    rename_column :profile_sub_items, :profile_item_id, :person_profile_id
  end
end
