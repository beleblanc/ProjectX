class Person < ActiveRecord::Base
  has_attached_file :pin_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  attr_accessible :city, :dob, :email, :employer, :first_name, :home_address, :nationality, :occupation, :other_name, :pin, :post_address, :post_code, :province, :sex, :surname, :tel_home, :tel_mobile, :tel_office, :title, :township, :user,:pin_image


end
