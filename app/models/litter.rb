class Litter < ActiveRecord::Base
  attr_accessible :date_of_birth, :disabled, :litter_sym, :banner
  has_attached_file :banner, :styles => {:w600 => "600", :w300 => "300", :medium => "600x600>", :small => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	has_many :dogs, foreign_key: :litter_sym, primary_key: :litter_sym

	def pets_count_for_sale
		if self.dogs.count > 0 and self.dogs.for_sale.count.zero?
			I18n.t "All pets were sold"
		else
			#I18n.t "Pets count for sale", all_count: self.dogs.count, for_sale_count: self.dogs.for_sale.count 
			" "
		end
	end
end
