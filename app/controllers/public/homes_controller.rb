class Public::HomesController < ApplicationController
  def top
    @item = Item.new
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end
end
