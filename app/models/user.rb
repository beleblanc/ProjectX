class User < ActiveRecord::Base
  resourcify
  rolify
  has_and_belongs_to_many :roles, :join_table => :users_roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids
  # attr_accessible :title, :body

  accepts_nested_attributes_for :roles,:allow_destroy => true

  def role?(role)
     !!self.roles.find_by_name(role.to_s)
  end
  
  def to_s
    "#{username}"
  end
  
end
