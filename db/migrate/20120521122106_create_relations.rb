class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :name
    end
  end
end
