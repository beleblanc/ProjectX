class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :staff_id
      t.text :description

      t.timestamps
    end
  end
end
