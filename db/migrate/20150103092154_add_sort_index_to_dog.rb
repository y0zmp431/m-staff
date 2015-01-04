class AddSortIndexToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :sort_index, :integer, default: 100
  end
end
