class CreateWaitLists < ActiveRecord::Migration
  def change
    create_table :wait_lists do |t|
      t.date :datetime_in
      t.string :payment_type, :limit => 10
      t.references :people
      t.string :next_action, :limit => 10
      t.string :next_action_name, :limit => 30
      t.boolean :attended, :default => false
      t.timestamps
    end
    add_index "wait_lists", "id"
    add_index "wait_lists", "people_id"
  end

  def down
    drop_table :wait_lists
  end
end
