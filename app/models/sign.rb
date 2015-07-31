class Sign < ActiveRecord::Base
  # association
  belongs_to :payment

  # validation
  validates :payment_id, presence: true
end
