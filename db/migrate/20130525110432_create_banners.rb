class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :target_url
      t.string :title
      t.text :content
      t.boolean :published, :null => false, :default => true

      t.timestamps
    end
  end
end
