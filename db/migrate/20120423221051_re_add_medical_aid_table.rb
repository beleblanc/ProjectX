class ReAddMedicalAidTable < ActiveRecord::Migration
  def change
    create_table :medical_aids do |t|
      t.string :name ,:limit =>50, :null => false
      t.string :address, :limit => 250
      t.string :city, :limit =>50
      t.string :province, :limit =>50
      t.string :country, :limit=>50
      t.string :contact_person
      t.string :email, :limit=> 50
      t.string :tel, :limit=>15
      t.string :fax, :limit=>15
      t.timestamps




    end
  end


end
