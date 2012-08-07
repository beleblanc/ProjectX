class CreateLabTests < ActiveRecord::Migration
  def change
    create_table :lab_tests do |t|
      t.string :name
      t.string :code
      t.string :short_code


    end
  end
end
