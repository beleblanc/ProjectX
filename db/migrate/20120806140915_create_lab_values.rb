class CreateLabValues < ActiveRecord::Migration
  def change
    create_table :lab_values do |t|
      t.references :lab_test
      t.string :name, :null=>false
      t.float :low_safe_range
      t.float :high_safe_range
      t.string :units

    end
  end
end
