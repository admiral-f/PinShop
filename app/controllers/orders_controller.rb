class OrdersController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create, :edit, :show]

  def create 
    @order=Order.new(order_params)
    @order.email=current_user.email
    if @order.adress!='office'
      @order.order_price+=5
    end
    if @order.save
      render action: :show
    else
      @error="your cart is empty"
      redirect_to pins_path
    end
  end

  def show
    @order=Order.find(params[:id])
    if (current_user.username!='admin') && (current_user.email!=@order.email)
      redirect_to pins_path
    end

  end

  def edit
    if current_user.username=='admin'
      @order=Order.find(params[:id])
    else
      redirect_to pins_path
    end
  end

  def update
    @order=Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
    else
      render action: 'edit'
    end
  end

  private

  def order_params
    params.require(:order).permit(:order, :first_name, :last_name, :phone, :adress, :order_price, :complete)
  end


end
