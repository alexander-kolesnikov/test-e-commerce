json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :price, :stock_level, :image
  json.url product_url(product, format: :json)
end
