json.array!(@payments) do |payment|
  json.extract! payment, :id, :city, :country
  json.url payment_url(payment, format: :json)
end
