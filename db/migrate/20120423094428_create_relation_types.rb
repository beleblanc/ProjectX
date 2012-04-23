class CreateRelationTypes < ActiveRecord::Migration
  def change
    create_table :relation_types do |t|
      t.string :relationType, :limit => 30
      t.timestamps
    end
    add_index("relation_types", "relation_types_id")
  end

  def down
    drop_table :relation_types
  end
end
