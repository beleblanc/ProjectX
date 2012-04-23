class CreateMedicalAidPlans < ActiveRecord::Migration
  def change
    create_table :medical_aid_plans do |t|
	t.references :medical_aids
	t.string :PlanName, :limit => 50
	t.timestamps
    end
	add_index("medical_aid_plans", "id")
	add_index("medical_aid_plans", "PlanName")
  end

  def down
	drop_table :medical_aid_plans
  end
end
