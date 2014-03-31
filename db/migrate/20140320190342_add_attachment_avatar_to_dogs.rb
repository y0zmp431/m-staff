class AddAttachmentAvatarToDogs < ActiveRecord::Migration
  def self.up
    change_table :dogs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :dogs, :avatar
  end
end
