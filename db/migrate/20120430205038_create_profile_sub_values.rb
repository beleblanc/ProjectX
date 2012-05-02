class CreateProfileSubValues < ActiveRecord::Migration
  def up
    create_table :profile_sub_values do |t|
      t.integer :profile_id
      t.integer :profile_sub_type_id
      t.string :value

      t.timestamps
    end
    add_index("profile_sub_values", "profile_id")
    add_index("profile_sub_values", "profile_sub_type_id"  )
  end

  def down
    drop_table :profile_sub_values
  end
end
