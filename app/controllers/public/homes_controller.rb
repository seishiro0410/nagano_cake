class Public::HomesController < ApplicationController
  def top
    @item = Item.new
    @items = Item.page(params[:page])
  end

  def about
  end
end
