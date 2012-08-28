class RenameColumnSubmittedForClaim < ActiveRecord::Migration
  def up
    rename_column :invoices, :submitted_for_claim?, :submitted_for_claim
  end

  def down
    rename_column :invoices, :submitted_for_claim, :submitted_for_claim?
  end
end
