class Sign < ActiveRecord::Base
  # association
  belongs_to :payment

  # validation
  validates :payment_id, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["id","payment_id","signature","created_at","updated_at"]
      all.each do |user|
        csv << [user.id,user.payment_id,user.signature,user.created_at,user.updated_at]
      end
    end
  end
end
