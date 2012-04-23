class RemoveMedicalAidTable < ActiveRecord::Migration
  def change
    drop_table :medical_aids
  end


end
