class CreateContacts < ActiveRecord::Migration
    create_table :contacts do |t|
      t.string :main_phone
      t.text :phones
      t.string :email
      t.string :skype
      t.string :gtalk
      t.text :adress
      t.text :desc

      t.timestamps
    end
  end
