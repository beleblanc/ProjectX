class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.integer :person_id
      t.integer :profile_type_id
      t.string :description
      t.date :time
      t.integer :user_id
      t.boolean :snapshot, :default => false

      t.timestamps
    end
    add_index("profiles", "person_id")
  end

  def down
    drop_table :profiles
  end
end
