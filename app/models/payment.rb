class Payment < ActiveRecord::Base

  # validation
	validates :amount, :product_name, :customer_name, :address, :city, :state, 
            :post_code, :country, :email, :card_number, :phone,
            presence: true
	validates :amount,  numericality: { only_float: true }
end
