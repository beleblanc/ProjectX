class CreateIcds < ActiveRecord::Migration
  def change
    create_table :icds do |t|
      t.text :description
      t.integer :icd_category_id

      t.timestamps
    end
  end
end
