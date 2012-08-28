class RenameColumnDepartmentOperationIdOrders < ActiveRecord::Migration
  def up
    rename_column :orders, :department_operations_id, :department_operation_id
  end

  def down
    rename_column :orders, :department_operation_id, :department_operations_id
  end
end
