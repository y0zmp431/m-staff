class RemoveDisabledInArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :disabled
  end

  def down
    add_column :articles, :disabled, :boolean, :default => true
  end
end
