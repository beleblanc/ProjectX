class CreateProfileSubItems < ActiveRecord::Migration
  def up
    create_table :profile_sub_items do |t|
      t.integer :person_profile_id
      t.integer :profile_sub_type_id
      t.string :value
      t.datetime :time
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :profile_sub_items
  end
end
