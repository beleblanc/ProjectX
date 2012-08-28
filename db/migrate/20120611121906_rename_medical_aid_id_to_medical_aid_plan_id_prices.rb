class RenameMedicalAidIdToMedicalAidPlanIdPrices < ActiveRecord::Migration
  def up
    rename_column :prices, :medical_aid_id, :medical_aid_plan_id
  end

  def down
    rename_column :prices, :medical_aid_plan_id, :medical_aid_id
  end
end
