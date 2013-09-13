class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8'  do |t|
      t.string :url
      t.string :name
      t.string :fullname
      t.boolean :male, :null => true
      t.boolean :for_sale, :null => false, :default => 0
      t.boolean :for_love, :null => false, :default => 0
      t.boolean :from_us, :null => false, :default => 1
      t.datetime :date_of_birth
      t.text :desc
      t.string :pedigree
      t.boolean :disabled, :null => false, :default => 0
      t.text :owner_desc

      t.timestamps
    end
  end
end
