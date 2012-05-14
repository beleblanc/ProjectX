class CreateProfileTypes < ActiveRecord::Migration
  def up
    create_table :profile_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def down
    drop_table :profile_types
  end
end
