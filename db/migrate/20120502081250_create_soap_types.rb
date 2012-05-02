class CreateSoapTypes < ActiveRecord::Migration
  def change
    create_table :soap_types do |t|
      t.string :name
      t.text :instructions

      t.timestamps
    end
  end
end
