class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :product_name
      t.string :customer_name
      t.text   :address
      t.string :city
      t.string :state
      t.string :post_code
      t.string :country
      t.string :phone
      t.string :email
      t.string :card_number
      t.decimal :amount, precision: 8, scale: 2
      t.boolean :is_signed, default: false
      t.string :token
      t.string :slug
      t.string :card_expiry
      t.string :card_cvv
      t.date :date_of_birth
      t.timestamps
    end
    add_index :payments, :user_id
    add_index :payments, :slug, unique: true
  end
end
