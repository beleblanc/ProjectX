class FixMedicalAidAndMedicalAidPlanNamingStructure < ActiveRecord::Migration
  def up
    rename_column :medical_aid_plans, :plan_name, :name
    rename_column :person_medical_aids, :people_id, :person_id
    rename_column :person_medical_aids, :medical_aids_id, :medical_aid_plan_id
    rename_column :medical_aid_plans, :medical_aids_id, :medical_aid_id
    rename_column :person_medical_aids, :aid_number, :number
  end

  def down
    rename_column :medical_aid_plans,:name ,:plan_name
    rename_column :person_medical_aids, :person_id, :people_id
    rename_column :person_medical_aids, :medical_aid_plan_id, :medical_aids_id
    rename_column :medical_aid_plans, :medical_aid_id, :medical_aids_id
    rename_column :person_medical_aids, :number, :aid_number
  end
end
