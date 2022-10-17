class Public::OrdersController < ApplicationController
  def new
    return redirect_to cart_items_path if current_customer.cart_items.blank?
    @order = Order.new
  end

  def information
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
    @order.shipping_postal_code = current_customer.postal_code
    @order.shipping_address = current_customer.address
    @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.shipping_postal_code = @address.postal_code
    @order.shipping_address = @address.address
    @order.shipping_name = @address.name
    elsif params[:order][:select_address] == "2"
    end
    @cart_items = CartItem.all
    @total_amount = 0
  end

  def thanx
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    @order.status = 0

    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.purchase_quantity = cart_item.amount
      @order_detail.tax_included_price = (cart_item.item.price * 1.1).floor
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_thanx_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @total_amount = 0
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:method_of_payment, :shipping_postal_code, :shipping_address, :shipping_name, :billing_amount)
  end

end
