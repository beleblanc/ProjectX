class CreateProfileTypes < ActiveRecord::Migration
  def up
    create_table :profile_types do |t|
      t.string :name, :limit => 50
      t.boolean :snapshot, :default => false

      t.timestamps
    end
    add_index("profile_types", "name")
  end

  def down
    drop_table :profile_sub_types
  end
end
