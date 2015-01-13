class AddAttachmentBannerToLitters < ActiveRecord::Migration
  def self.up
    change_table :litters do |t|
      t.attachment :banner
    end
  end

  def self.down
    drop_attached_file :litters, :banner
  end
end
