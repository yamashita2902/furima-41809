class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
    redirect_to root_path
  end

 private # プライベートメソッド
    def item_params
      params.require(:item).permit(:name, :explanation, :price,:category_id,:situation_id, :prefecture_id, :arrives_day_id, :deliverystyle_id,:image).merge(user_id: current_user.id)
    end

     
  end
end
