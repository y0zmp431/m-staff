class CreateBanner < ActiveRecord::Migration
  def change 
    create_table :banners  do |t|
			t.string    :banner_type
			t.string    :target_url
      t.string    :title
      t.text      :content
      t.boolean   :disabled, :null => false, :default => false
      t.timestamps
		end
  end
end
