class Image < ActiveRecord::Base
  attr_accessible :event_id, :source
  has_attached_file :source, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }
end
