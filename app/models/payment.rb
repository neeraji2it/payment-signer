class Payment < ActiveRecord::Base
	validates :amount, :product_name, :customer_name, :address, :city, :state, :post_code, :country,:email, :card_number, :presence=>"true"
	validates :phone, :presence => true, format: { with: /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\Z/,
	message: " Phone numbers must be in xxx-xxx-xxxx format" }
	validates :amount,  numericality: {only_float: true}
	validates :post_code,:card_number, numericality: { only_integer: true }
end
