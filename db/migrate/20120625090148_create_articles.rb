class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :url
      t.string :title
      t.string :section
      t.text :short_text
      t.text :text
      t.boolean :active, :null => false, :default => 0

      t.timestamps
    end
  end
end
