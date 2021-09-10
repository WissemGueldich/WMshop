json.array!(@products) do |product|
    json.title product.title
    json.url product_path(product)
end