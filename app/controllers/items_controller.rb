class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit, :update]
  before_action :set_item, only: [:show,:edit]
  before_action :redirect_unless_owner, only: [:update,:edit]
  
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private # プライベートメソッド

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :situation_id, :prefecture_id, :arrives_day_id,
                                 :delivery_style_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_unless_owner
    redirect_to root_path unless @item.owned_by?(current_user)
  end
  

end
