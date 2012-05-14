class CreateProfileSubTypes < ActiveRecord::Migration
  def up
    create_table :profile_sub_types do |t|
      t.integer :profile_type_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def down
    drop_table :profile_sub_types
  end
end
