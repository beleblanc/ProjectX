class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies, :id=>false do |t|
      t.integer :person_id
      t.integer :dependent_id
      t.integer :relation_id

      t.timestamps
    end
  end
end
