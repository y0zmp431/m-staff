class Photo < ActiveRecord::Base
  attr_accessible :disabled, :index_of_order, :image, :dogs, :dog_ids
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_and_belongs_to_many :dogs
end
