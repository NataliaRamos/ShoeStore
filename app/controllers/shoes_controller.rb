class ShoesController < ApplicationController
  def index
    @seller = Seller.find(session[:id])
    @shoe = Shoe.joins(:seller).all
  end

  def create
    @seller = Seller.find(session[:id])
    @shoe = @seller.shoes.new(shoe_params)
    if @shoe.save
      redirect_to "/shoes"
    else
      flash[:notice] = "There was an error creating your post"
      redirect_to "/mains"
    end
  end

  def destroy
    Shoe.delete(params[:id])
    redirect_to "/dashboard/#{session[:id]}"
  end

  private

  def shoe_params
    params.require(:shoe).permit(:name, :amount, :seller_id)
  end
end
