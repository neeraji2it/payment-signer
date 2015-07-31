class AddCardExpiryAndCardCvvToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :card_expiry, :string
    add_column :payments, :card_cvv, :string
  end
end
