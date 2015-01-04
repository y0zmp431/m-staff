class AddMedicalTestsIndexToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :medical_tests, :text
    add_column :dogs, :trophies, :text
  end
end
