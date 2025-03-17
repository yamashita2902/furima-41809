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

  def private_method  # プライベートメソッド
    def item_params
      params.require(:item).permit(:name, :explanation, :price,:user,:category_id,:situation_id, :prefecture_id, :arrives_day_id, :deliverystyle_id)
    end

  end

  def any_method  # プライベートメソッド
    
  end
end
