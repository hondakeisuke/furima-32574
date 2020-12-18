class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :current_user, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :correct_user, only: [:edit, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:items_name, :explanation, :category_id, :condition_id, :delivery_free_id, :delivery_day_id,
                                 :prefecture_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end

  def correct_user
    redirect_to(root_url) unless @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
