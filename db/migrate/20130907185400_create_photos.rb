class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.boolean :disabled
      t.integer :index_of_order

      t.timestamps
    end
  end
end
