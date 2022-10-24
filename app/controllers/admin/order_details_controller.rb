class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order_details = @order_detail.order.order_details
    # binding.pry
    if @order_detail.update(order_detail_params)
       @order_detail.order.update(status: "production") if @order_detail.is_production == "can"
       @order_detail.order.update(status: "preparation") if @order_details.pluck(:is_production).uniq == ["complete"]
       redirect_to admin_order_path(@order_detail.order.id)
    else
    redirect_to admin_order_path(@order_detail.order.id)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:is_production)
  end
end
