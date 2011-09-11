class User < ActiveRecord::Base
  has_many :articles
  belongs_to :roles
  
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  
  def to_param
    name
  end
end
