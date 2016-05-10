class PurchasesController < ApplicationController
  def index
  end

  def create
    puts params
    puts "getting to create buy button"
    shoe = Shoe.find(params[:id])
  	purchase = Purchase.new(seller_id: shoe.seller_id, shoe_id: shoe.id, buyer_id: session[:id])
    puts purchase.inspect
    if purchase.save
      shoe.update(:sold => true)
  	  redirect_to "/dashboard/#{session[:id]}"
    else
      flash[:notice] = "Something went wrong with your purchase"
      puts purchase.errors.full_messages
      redirect_to "/shoes"
    end
  end
end
