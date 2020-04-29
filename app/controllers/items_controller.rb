class ItemsController < ApplicationController
  
  def index #トップページ

  end

  def new
    @item = Item.new
    @item.pictures.new
    @todohuken = Prefecture.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def hoge
  end
  def hige
  end
  def huge
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :size, :status, :charge, :region, :price, :date, :brand,pictures_attributes: [:image]).merge(seller_id: current_user.id)
  end
end
