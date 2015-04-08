class Payment < ActiveRecord::Base

  # validation
	validates :amount, :product_name, :customer_name, :address, :city, :state, 
            :post_code, :country, :card_number, :phone,
            presence: true
	validates :amount,  numericality: { only_float: true }
  validates :email, presence: true,
                    :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ ,
                    :message => 'is invalid!'},
                    :on => :create

  # association
  has_one :signature
end
