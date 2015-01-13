class CreateLitters < ActiveRecord::Migration
  def change
    create_table :litters do |t|
      t.string :litter_sym
      t.date :date_of_birth

      t.timestamps
    end
  end
end
