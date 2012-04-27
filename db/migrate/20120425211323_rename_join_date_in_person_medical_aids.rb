class RenameJoinDateInPersonMedicalAids < ActiveRecord::Migration
  def up
    rename_column :person_medical_aids, :joinDate, :join_date
  end

  def down
    rename_column :person_medical_aids, :join_date, :joinDate
  end
end
