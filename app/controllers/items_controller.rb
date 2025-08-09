class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_day_id, :price, :item_image).merge(user_id: current_user.id)
  end
end
