class MainsController < ApplicationController
  def index
  end

  def create
    seller = Seller.find_by_email(params[:email])
    if seller && seller.authenticate(params[:password])
      session[:id] = seller[:id]
      redirect_to '/shoes'
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to "/mains"
    end
  end

  def destroy
    session[:seller_id] = nil
    redirect_to '/mains'
  end
end
