class Payment < ActiveRecord::Base
  extend FriendlyId
  friendly_id :customer_name, use: :slugged
  
  # validation
	validates :amount, :product_name, :customer_name, :address, :city, :state, 
            :post_code, :country, :card_number, :phone, :card_expiry, :card_cvv, 
            :date_of_birth, presence: true
	validates :amount,  numericality: { only_float: true }
  validates :email, presence: true,
                    :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ ,
                    :message => 'is invalid!'},
                    :on => :create

  # association
  has_one :sign, dependent: :destroy
  belongs_to :user
end
