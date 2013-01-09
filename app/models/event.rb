class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"

  def created_by?(user)
    creator == user
  end
end
