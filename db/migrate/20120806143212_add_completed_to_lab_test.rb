class AddCompletedToLabTest < ActiveRecord::Migration
  def change
    add_column :lab_tests, :completed, :boolean , :default => false
  end
end
