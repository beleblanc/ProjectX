class ChangeMedicalAidPlanName < ActiveRecord::Migration
  def up
    rename_column :medical_aid_plans, :PlanName, :plan_name
  end

  def down
    rename_column :medical_aid_plans, :plan_name, :PlanName
  end
end
