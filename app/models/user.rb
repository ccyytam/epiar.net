class User < ActiveRecord::Base
  has_many :news
  belongs_to :roles
  
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
end
