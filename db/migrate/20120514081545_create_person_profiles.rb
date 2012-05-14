class CreatePersonProfiles < ActiveRecord::Migration
  def up
    create_table :person_profiles do |t|
      t.integer :person_id
      t.datetime :time
      t.integer :user_id
      t.string :comments

      t.timestamps
    end
  end

  def down
    drop_table :person_profiles
  end
end
