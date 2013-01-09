class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email

  has_many :events, :foreign_key => :creator_id
end
