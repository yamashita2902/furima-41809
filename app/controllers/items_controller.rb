class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.all
  end
  
end
