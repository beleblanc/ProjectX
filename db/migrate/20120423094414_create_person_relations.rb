class CreatePersonRelations < ActiveRecord::Migration
  def up
    create_table :person_relations, :id => false do |t|
      t.references :person1, :People
      t.references :person2, :People
      t.references :relation, :RelationType
      t.timestamps
    end
    add_index("person_relations", "person1_id")
    add_index("person_relations", "person2_id")
    add_index("person_relations", "relation_id")
  end

  def down
    drop_table :person_relations
  end
end
