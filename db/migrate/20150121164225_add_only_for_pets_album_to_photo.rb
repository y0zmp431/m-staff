class AddOnlyForPetsAlbumToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :only_for_pets_album, :boolean, default: false
  end
end
