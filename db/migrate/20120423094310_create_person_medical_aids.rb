class CreatePersonMedicalAids < ActiveRecord::Migration
  def change
    create_table :person_medical_aids do |t|
      t.references :people
      t.integer :aid_number
      t.references :medical_aids
      t.string :status, :limit => 15
      t.date :joinDate
      t.timestamps
    end
    add_index("person_medical_aids", "people_id")
    add_index("person_medical_aids", "medical_aids_id")
  end

  def down
    drop_table :person_medical_aids
  end
end
