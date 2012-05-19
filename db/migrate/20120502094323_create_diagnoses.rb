class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.integer :soap_id
      t.integer :icd_id
      t.text :comments
      t.datetime :time
      t.integer :user_id

      t.timestamps
    end
  end
end
