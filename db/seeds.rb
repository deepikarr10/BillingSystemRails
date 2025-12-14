# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# db/seeds.rb

# Base products
products = [
  { name: "Pen", product_code: "P100", stock: 100, price: 10, tax_percentage: 5 },
  { name: "Notebook", product_code: "N200", stock: 50, price: 50, tax_percentage: 12 },
  { name: "Eraser", product_code: "E301", stock: 200, price: 5, tax_percentage: 5 },
  { name: "Marker", product_code: "M401", stock: 80, price: 25, tax_percentage: 18 },
  { name: "Ruler", product_code: "R501", stock: 120, price: 15, tax_percentage: 5 },
  { name: "Stapler", product_code: "S601", stock: 60, price: 150, tax_percentage: 12 },
  { name: "Glue Stick", product_code: "G701", stock: 150, price: 20, tax_percentage: 5 },
  { name: "Highlighter", product_code: "H801", stock: 100, price: 30, tax_percentage: 18 },
  { name: "Paper Clips", product_code: "PC901", stock: 500, price: 2, tax_percentage: 5 },
  { name: "Scissors", product_code: "SC1001", stock: 70, price: 40, tax_percentage: 12 },
  { name: "Calculator", product_code: "C1101", stock: 40, price: 500, tax_percentage: 18 },
  { name: "Drawing Book", product_code: "DB1201", stock: 90, price: 60, tax_percentage: 12 },
  { name: "Water Bottle", product_code: "WB1301", stock: 150, price: 80, tax_percentage: 18 },
  { name: "Laptop Bag", product_code: "LB1401", stock: 35, price: 1200, tax_percentage: 18 },
  { name: "Desk Organizer", product_code: "DO1501", stock: 50, price: 200, tax_percentage: 12 }
]

products.each do |prod|
  Product.find_or_create_by!(product_code: prod[:product_code]) do |p|
    p.name = prod[:name]
    p.stock = prod[:stock]
    p.price = prod[:price]
    p.tax_percentage = prod[:tax_percentage]
  end
end


