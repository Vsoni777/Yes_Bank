# ou are given an array of hashes. Each hash represents a product and contains the following keys: :name, :price, and :category. Your task is to write a method group_products_by_category that:
# 1. Groups the products by their categories.
# 2. Calculates the total number of products and the total price for each category.
# 3. Returns a hash where each key is a category, and the value is another hash containing:
# :products - an array of product names in that category.
# :total_count - the total number of products in that category.
# :total_price - the sum of the prices of all products in that category.

$products = [
  { name: "Laptop", price: 1000, category: "Electronics" },
  { name: "Phone", price: 700, category: "Electronics" },
  { name: "T-shirt", price: 20, category: "Clothing" },
  { name: "Jeans", price: 40, category: "Clothing" },
  { name: "Fridge", price: 500, category: "Appliances" },
  { name: "Microwave", price: 150, category: "Appliances" }
]

# Example Output:

# {
#   "Electronics" => {
#     products: ["Laptop", "Phone"],
#     total_count: 2,
#     total_price: 1700
#   },
#   "Clothing" => {
#     products: ["T-shirt", "Jeans"],
#     total_count: 2,
#     total_price: 60
#   },
#   "Appliances" => {
#     products: ["Fridge", "Microwave"],
#     total_count: 2,
#     total_price: 650
#   }
# }
   

def getarray_of(catgory)
  arr=[]
$products.each do |product|
  if catgory==product[:category]
     arr<<product[:name]
  end
end
return arr
end

def get_totalcount(catgory)
  count=0
  $products.each do |product|
    if catgory==product[:category]
        count+=1
    end
  end
  return count
end

def get_totalpice(catgory)
  price=0
  $products.each do |product|
    if catgory==product[:category]
        price+=product[:price]
    end
  end
  return price
end

def create_newhash
  arr=[]
  new_arr=[]
  $products.each do |product|
     value=product[:category]
     new_arr<<value
  end
   new_arr.uniq!.each do |catgory|
     arr<<to_insert(catgory)
   end
   return arr
end

def to_insert(catgory)
  return {
    catgory  =>   getarray_of(catgory),
    total_count: get_totalcount(catgory),
     total_price: get_totalpice(catgory)
  }
end

 arr=create_newhash
 puts arr