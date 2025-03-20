class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    # @item = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

 private # プライベートメソッド
    def item_params
      params.require(:item).permit(:name, :explanation, :price,:category_id,:situation_id, :prefecture_id, :arrives_day_id, :delivery_style_id,:image).merge(user_id: current_user.id)
    end

     
  
end
