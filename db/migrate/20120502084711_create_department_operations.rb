class CreateDepartmentOperations < ActiveRecord::Migration
  def change
    create_table :department_operations do |t|
      t.integer :department_id
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end
