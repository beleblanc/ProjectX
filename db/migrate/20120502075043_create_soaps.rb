class CreateSoaps < ActiveRecord::Migration
  def change
    create_table :soaps do |t|
      t.integer :consultation_id
      t.integer :soap_type_id
      t.integer :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
