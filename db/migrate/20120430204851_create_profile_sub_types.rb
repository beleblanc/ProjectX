class CreateProfileSubTypes < ActiveRecord::Migration
  def up
    create_table :profile_sub_types do |t|
      t.integer :profile_type_id
      t.string :name, :limit => 50
      t.string :description
      t.string :validation

      t.timestamps
    end
    add_index("profile_sub_types", "profile_type_id")
    add_index("profile_sub_types", "name")
  end

  def down
    drop_table :profile_sub_types
  end
end
