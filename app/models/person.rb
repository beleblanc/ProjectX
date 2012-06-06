class Person < ActiveRecord::Base
  has_attached_file :pin_image, :styles => { :medium => "250x250>", :thumb => "100x100>" }
  has_many :person_medical_aids, :foreign_key => :people_id
  has_many :wait_lists
  has_many :consultations
  has_many :soaps, :through => :consultations
  has_many :orders, :through => :soaps
  has_many :diagnoses, :through => :soaps
  has_many :dependencies
  has_many :dependents, :through => :dependencies
  has_one :inverse_dependency,  :class_name => "Dependency", :foreign_key => "dependent_id"
  has_one :inverse_dependent, :through => :inverse_dependency, :source => :person
  has_one :person_profile

  attr_accessor :relation
  attr_accessible :city, :dob, :email, :employer, :first_name, :home_address, :nationality, :occupation, :other_name, :pin, :post_address, :post_code, :province, :sex, :surname, :tel_home, :tel_mobile, :tel_office, :title, :township, :user,:pin_image, :person_medical_aids_attributes,:dependencies_attributes, :relation

  accepts_nested_attributes_for :person_medical_aids, :allow_destroy => true,:reject_if => :all_blank
  accepts_nested_attributes_for :dependencies, :allow_destroy => true

  validates_uniqueness_of :pin  , :allow_blank => true
  validates_numericality_of :pin,:tel_home,:tel_mobile,:tel_office , :allow_blank => true

  def to_s
    "#{self.first_name} #{self.surname}"
  end

  def create_dependency(person_id )
    Dependency.create(:person_id=> person_id, :dependent_id=> self.id, :relation_id => self.relation)
  end

end
