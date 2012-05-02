class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.datetime :time
      t.integer :wait_list_id
      t.integer :user_id
      t.string :status, :length => 15

      t.timestamps
    end
  end
end
