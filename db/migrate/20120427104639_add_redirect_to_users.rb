class AddRedirectToUsers < ActiveRecord::Migration
  def change
    add_column :users, :redirect, :string
  end
end
