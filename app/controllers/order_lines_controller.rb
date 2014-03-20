class OrderLinesController < ApplicationController

	def index

	end

	def new
		@order_line = OrderLine.new
	end

	def create	
		@current_order = session[:cookies_orderid]
		@qty = params[:Quantity]
		@line_number = params[:LineNumber]

		@update_qty = HTTParty.post("https://preview.webservices.fujifilmesys.com/spa/v2/Orders/#{@current_order}/lines/#{@line_number}/?qty=#{@qty}",
		:headers => { "Content-length" => "0" ,
					  "Content-Type" => "text/json",
					  "Authorization" => "ApiKey=6dc08434e25b48ec9c0f209ee83eb5aa" })

	 	@order_line = OrderLine.new(order_line_params)
	    if @order_line.save
	     redirect_to shoppingcart_path
	    else
	     redirect_to products_path
	    end
	end

	def destroy
		@current_order = session[:cookies_orderid]
		@order_line = OrderLine.find(params[:id])
		@fuji_line = @order_line.LineNumber
		@destroy_line = HTTParty.delete("https://preview.webservices.fujifilmesys.com/spa/v2/Orders/#{@current_order}/lines/#{@fuji_line}/",
		:headers => { "Content-length" => "0" ,
					  "Content-Type" => "text/json",
					  "Authorization" => "ApiKey=6dc08434e25b48ec9c0f209ee83eb5aa" })
		@order_line.destroy()
		redirect_to shoppingcart_path
	end

		private
			def order_line_params
				params.permit(:order_id, :preview_url, :LineNumber, :ProductCode, :Quantity, :UnitPrice, :PageNumber, :AssetNumber, :Name, :HiResImage, :CropMode)
			end

end
