class PurchaserecordsController < ApplicationController
  before_action :set_item, only: [:index, :new, :create]
  before_action :redirect_sold_out, only: [:index]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchaserecord_shipping_address = PurchaserecordShippingAddress.new
  end

  def new
    @purchaserecord_shipping_address = PurchaserecordShippingAddress.new
  end

  def create
    @purchaserecord_shipping_address = PurchaserecordShippingAddress.new(purchaserecord_params)

    if @purchaserecord_shipping_address.valid?
      pay_item
      @purchaserecord_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private # プライベートメソッド

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchaserecord_params
    params.require(:purchaserecord_shipping_address).permit(
      :post_code, :prefecture_id, :city, :street, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    item = Item.find(params[:item_id])
    amount = item.price
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: amount,
      card: purchaserecord_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_sold_out
    redirect_to root_path if @item.sold_out?
  end
end
