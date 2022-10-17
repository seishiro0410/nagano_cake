class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.postage = 800
    @total_amount = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:method_of_payment, :shipping_postal_code, :shipping_address, :shipping_name, :billing_amount, :status)
  end
end
