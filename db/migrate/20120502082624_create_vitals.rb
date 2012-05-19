class CreateVitals < ActiveRecord::Migration
  def change
    create_table :vitals do |t|
      t.integer :soap_id
      t.datetime  :time
      t.string    :blood_pressure
      t.integer   :pulse
      t.decimal   :temperature
      t.integer   :respiratory_rate
      t.decimal   :height
      t.decimal   :weight

      t.timestamps
    end
  end
end
