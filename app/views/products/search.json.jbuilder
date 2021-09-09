json.products do
    json.array!(@products) do |product|
        json.name product.title
        json.url product_path(product)
    end
end
