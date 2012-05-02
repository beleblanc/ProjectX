class RemoveProfileTypeInProfiles < ActiveRecord::Migration
  def change
    remove_column(:profiles, "profile_type_id")
    remove_column(:profiles, "description")
    remove_column(:profiles, "snapshot")
  end
end
