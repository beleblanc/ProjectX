class RenameSoapsIdInOrders < ActiveRecord::Migration
  def up
    rename_column :orders, :soaps_id, :soap_id
  end

  def down
    rename_column :orders, :soap_id, :soaps_id
  end
end
