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

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["id","product_name","customer_name","address","city","state","post_code","country","phone", "email","card_number","amount","is_signed","created_at","updated_at","token","slug","user_id","card_expiry","card_cvv","date_of_birth"]
      all.each do |user|
        csv << [user.id,user.product_name,user.customer_name, user.address,user.city,user.state,user.post_code,user.country,user.phone, user.email,user.card_number,user.amount,user.is_signed,user.created_at,user.updated_at,user.token,user.slug,user.user_id,user.card_expiry,user.card_cvv,user.date_of_birth]
      end
    end
  end
end
