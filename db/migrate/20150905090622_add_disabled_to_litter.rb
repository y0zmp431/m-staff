class AddDisabledToLitter < ActiveRecord::Migration
  def change
    add_column :litters, :disabled, :boolean, default: false
  end
end
