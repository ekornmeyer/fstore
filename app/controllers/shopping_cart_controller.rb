class ShoppingCartController < ApplicationController

	def show

		@current_order = session[:cookies_orderid]
  		@db_lines = OrderLine.where("order_id = ?", @current_order)
  		
	end

	def update_quantity

		@current_order = session[:cookies_orderid]
		@db_lines = OrderLine.where("order_id = ?", @current_order)

		@order_line_count = 0

		params[:ids_to_update].split(',').each do |paramid|
			@db_line = OrderLine.find(paramid)
			if OrderLine.valid_attribute?(:Quantity, params["updated_quantity#{paramid}"])
			@db_line.update_column(:Quantity, params["updated_quantity#{paramid}".to_sym])
			@order_line_count += 1
			else
			@order_line_count -= 1	
			end
		end

			if @order_line_count == @db_lines.count
			redirect_to shoppingcart_path
			else
			redirect_to shoppingcart_path, :flash => { :error => "Quantity must be a number." }
			end		

	end

end