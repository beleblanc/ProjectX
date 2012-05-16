class Person < ActiveRecord::Base
  has_attached_file :pin_image, :styles => { :medium => "250x250>", :thumb => "100x100>" }
  has_many :person_medical_aids, :foreign_key => :people_id
  has_many :wait_lists, :foreign_key => :people_id
  has_many :consultations
  has_many :soaps, :through => :consultations
  has_many :orders, :through => :soaps
  has_many :diagnoses, :through => :soaps

  has_one :person_profile

  attr_accessible :city, :dob, :email, :employer, :first_name, :home_address, :nationality, :occupation, :other_name, :pin, :post_address, :post_code, :province, :sex, :surname, :tel_home, :tel_mobile, :tel_office, :title, :township, :user,:pin_image, :person_medical_aids_attributes

  has_many :consultations
  has_many :soaps, :through => :consultations
  has_many :orders, :through => :soaps
  has_many :diagnoses, :through => :soaps


  accepts_nested_attributes_for :person_medical_aids, :allow_destroy => true


  validates_uniqueness_of :pin

  validates_numericality_of :pin,:tel_home,:tel_mobile,:tel_office

  def to_s
    "#{self.first_name} #{self.surname}"

  end

end
