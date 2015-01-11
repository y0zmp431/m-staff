class AddLitterSymToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :litter_sym, :string
  end
end
