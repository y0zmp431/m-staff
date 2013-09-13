class CreateDogsPhotosJoinTable < ActiveRecord::Migration
  def change
    create_table :dogs_photos, :id => false do |t|
      t.integer :dog_id
      t.integer :photo_id
    end
  end
end
