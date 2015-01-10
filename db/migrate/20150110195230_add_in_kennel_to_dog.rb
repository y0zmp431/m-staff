class AddInKennelToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :in_kennel, :boolean, default: false
  end
end
