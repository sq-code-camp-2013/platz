class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many :event_attendees
  has_many :attendees, :through => :event_attendees, :source => :user 
  has_many :images


  def created_by?(user)
    creator == user
  end

  def attended_by?(user)
    attendees.include?(user)
  end
end
