json.array!(@orders) do |order|
  json.extract! order, :id, :email, :total
  json.url order_url(order, format: :json)
end
