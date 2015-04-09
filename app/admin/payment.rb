ActiveAdmin.register Payment do
  actions :index, :show


  index do
    selectable_column
    id_column
    column :user_id, as: 'User' do |payment|
      payment.try(:user).try(:email)
    end
    column :customer_name
    column :email
    column :amount
    column :product_name
    column :address
    column :country
    column :card_number
    column :phone
    actions
  end

  filter :user_email, as: :string
  filter :email
  filter :customer_name
  filter :card_number
  filter :phone

  show do |product|
    attributes_table do
      row :customer_name
      row :email
      row :amount
      row :product_name
      row :address
      row :city
      row :state
      row :post_code
      row :country
      row :card_number do |payment|
        "xxxx xxxx xxxx #{payment.card_number}"
      end
      row :phone
    end
  end

end
