# ou are given an array of hashes. Each hash represents a product and contains the following keys: :name, :price, and :category. Your task is to write a method group_products_by_category that:
# 1. Groups the products by their categories.
# 2. Calculates the total number of products and the total price for each category.
# 3. Returns a hash where each key is a category, and the value is another hash containing:
# :products - an array of product names in that category.
# :total_count - the total number of products in that category.
# :total_price - the sum of the prices of all products in that category.


class Product 
  attr_accessor :products,:result
  @@count=0
   def initialize
     @products = [
      { name: "Laptop", price: 1000, category: "Electronics" },
      { name: "Phone", price: 700, category: "Electronics" },
      { name: "T-shirt", price: 20, category: "Clothing" },
      { name: "Jeans", price: 40, category: "Clothing" },
      { name: "Fridge", price: 500, category: "Appliances" },
      { name: "Microwave", price: 150, category: "Appliances" }
    ]
    @result={}
   end

   def make_hash
    if result.empty?
    products.each do |product|
      category=product[:category]
      result[category] ||={product: [],total_count: 0,total_price: 0.0}
      result[category][:product]<<product[:name]
      result[category][:total_count]+=1
      result[category][:total_price]+=product[:price]
    end
    @@count+=1
    end
   end

   def search_word(category)
    p result[category]&[:product]
   end
end

m= Product.new
m.make_hash
m.search_word("cwqejof")
