class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create, :current, :sold_out]
  before_action :authenticate_user!, only: [:index]
  before_action :current, only: [:index]
  before_action :sold_out, only: [:index]
  def index
    @order = Order.new
    @credit = Credit.new
  end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
    if @credit.valid?
      pay_item
      @credit.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :tell_number).merge(
      token: params[:token], item_id: @item.id, user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: credit_params[:token],
      currency: 'jpy'
    )
  end

  def current
    redirect_to root_path if @item.user_id == current_user.id
  end

  def sold_out
    redirect_to root_path if @item.order
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
