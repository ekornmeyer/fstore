# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  @response = HTTParty.get("https://preview.webservices.fujifilmesys.com/spa/v2/Catalogs/MailOrder?ApiKey=6dc08434e25b48ec9c0f209ee83eb5aa")
  @http_party_json = JSON.parse(@response.body)
  @just_products = @http_party_json ['products']
  @http_party_json.each do |i|
        i.each do |x|
   @just_products = x['Products']
   end
  end

  @just_products.each do |product|
    Product.create(:product_code => product['ProductCode'], :name => product['Name'], :description => product['Description'], :unit_price => product['UnitPrice'], :default_img_url => "https://preview.webservices.fujifilmesys.com/spa/v2/catalogs/10024/products/" + product['ProductCode'] + "/assets/Marketing.png")
  end