class AddAttachmentSourceToImages < ActiveRecord::Migration
  def self.up
    # create_table :images do |t|
    #   t.integer :event_id
    # end
    change_table :images do |t|
      t.attachment :source
    end
  end

  def self.down
    drop_attached_file :images, :source
    # drop_table :images
  end
end
