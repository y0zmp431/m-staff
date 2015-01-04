class RenameActiveField < ActiveRecord::Migration
  def up
		rename_column :users, :active, :disabled
		rename_column :articles, :active, :disabled
  end

  def down
  end
end
