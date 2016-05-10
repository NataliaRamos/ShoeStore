class DashboardController < ApplicationController
  def index
  end

  def show
      @seller = Seller.find(session[:id])
      @shoe = @seller.shoes
      @purchased = @seller.purchases
      @sales = @seller.sales
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      session[:id] = @seller.id
      redirect_to "/shoes"
    else
      flash[:errors] = @seller.errors.full_messages
      redirect_to "/mains"
    end
  end

  def destroy
  end

  private
  def seller_params
    params.require(:seller).permit(:first_name, :last_name, :email, :password)
  end
end
