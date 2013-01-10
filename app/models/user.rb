class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email

  has_many :created_events, :class_name => "Event", :foreign_key => :creator_id
  has_many :event_attendees
  has_many :events, :through => :event_attendees
end
