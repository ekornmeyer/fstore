class CheckoutController < ApplicationController
 before_action :signed_in_customer, only: [:show]
 before_action :correct_customer, only: [:show]

	def show

		if session[:cookies_orderid].nil?
			redirect_to '/shoppingcart'
		else
			@current_order = session[:cookies_orderid]
	  		@db_lines = OrderLine.where("order_id = ?", @current_order)
	  		@customer = current_customer
		end

	end

end