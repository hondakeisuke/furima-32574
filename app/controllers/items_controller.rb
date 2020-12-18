class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit]
  before_action :correct_user,   only: [:edit]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      @item.valid?
      render  :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:items_name, :explanation, :category_id, :condition_id, :delivery_free_id, :delivery_day_id,
                                 :prefecture_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    redirect_to(root_url) unless @item.user_id == current_user.id
  end
end
