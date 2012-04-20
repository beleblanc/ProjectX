class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :title, :limit=> 5
      t.string :first_name , :limit=>50
      t.string :surname  , :limit=>50
      t.date :dob
      t.string :other_name  , :limit=>50
      t.string :sex   , :limit=>1
      t.string :post_address , :limit=>150
      t.string :tel_home , :limit=>15
      t.string :tel_office , :limit=>15
      t.string :tel_mobile , :limit=>50
      t.string :email   , :limit=>50
      t.string :home_address   , :limit=>150
      t.string :city    , :limit=>50
      t.string :township   , :limit=>50
      t.string :province   , :limit=>50
      t.string :post_code  , :limit=>10
      t.string :nationality , :limit=>50
      t.string :pin   , :limit=>15
      t.string :employer   , :limit=>30
      t.string :occupation  , :limit=>30
      t.integer :user
      t.has_attached_file :pin_image
      t.timestamps
    end
  end
end
