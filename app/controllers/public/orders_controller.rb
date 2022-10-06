class Public::OrdersController < ApplicationController
  def new
    return redirect_to cart_items_path if current_customer.cart_items.blank?
  end

  def thanx
  end

  def index
  end

  def show
  end
end
