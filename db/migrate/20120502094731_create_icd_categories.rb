class CreateIcdCategories < ActiveRecord::Migration
  def change
    create_table :icd_categories do |t|
      t.text :name

      t.timestamps
    end
  end
end
