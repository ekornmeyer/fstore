class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	 t.string "product_code"
	 t.string "name"
	 t.string "description"
	 t.string "unit_price"
	 t.string "default_img_url"
      t.timestamps
    end
  end
end
