class AddDateOfDeathToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :date_of_death, :date
  end
end
