class ChangeSoapCommentColumnToText < ActiveRecord::Migration
  def up
    change_column :soaps, :comment, :text
  end

  def down
    change_column :soaps, :comment, :integer
  end
end
