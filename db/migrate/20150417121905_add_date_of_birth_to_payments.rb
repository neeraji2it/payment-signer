class AddDateOfBirthToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :date_of_birth, :date
  end
end
