class ChangeDateOfBidthType < ActiveRecord::Migration
  def up
    change_column :dogs, :date_of_birth, :date
  end

  def down
    change_column :dogs, :date_of_birth, :datetime
  end
end
