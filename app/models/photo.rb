class Photo < ActiveRecord::Base
  attr_accessible :disabled, :index_of_order, :image, :dogs, :dog_ids, :only_for_pets_album
  has_attached_file :image, :styles => {:w600 => "600", :w300 => "300", :h300 => "x300", :h600 => "x600", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_and_belongs_to_many :dogs

  def orientation
    if ! self.image.blank?
      orientation = Paperclip::Geometry.from_file(self.image).horizontal? ? 'horizontal' : 'vertical'
      puts orientation
      geometry = Paperclip::Geometry.from_file(self.image)
      puts "#{geometry.width} x #{geometry.height}"
      Paperclip::Geometry.from_file(self.image).horizontal? ? 'h' : 'v'
    end
  end

  def dogs_names
    self.dogs.pluck :name
  end

end
