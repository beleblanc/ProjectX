class PersonMedicalAid < ActiveRecord::Migration
  def up
	create_table :person_medical_aids do |t|
		t.references :person
		t.string :medicalaid_number, :limit => 20
		t.references :medicalAidPlan
		t.date :medicalAidJoinDate
	end
  end

  def down
	drop_table :person_medical_aids
  end
end
