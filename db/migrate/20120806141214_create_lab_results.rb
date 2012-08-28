class CreateLabResults < ActiveRecord::Migration
  def change
    create_table :lab_results do |t|
      t.references :lab_value
      t.references :lab_order
      t.references :user
      t.float      :value
      t.timestamps
    end
  end
end
