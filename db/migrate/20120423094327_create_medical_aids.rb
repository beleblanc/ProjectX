class CreateMedicalAids < ActiveRecord::Migration
  def change
    create_table :medical_aids do |t|
	t.string :name, :limit => 20
	t.string :tel, :limit => 15
	t.text :address
	t.string :fax, :limit => 15
	t.string :contactPerson, :limit => 50
	t.string :city, :limit => 15
	t.string :province, :limit => 25
	t.string :country, :limit => 100
	t.timestamps
    end
	add_index("medical_aids", "medical_aid_id")
	add_index("medical_aids", "name")
  end

  def down
	drop_table :medical_aids
  end
end
