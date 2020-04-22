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
      redirect_to root_path
    # Item.create(item_params)
    # redirect_to root_path
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
    params.require(:item).permit(:name, :price,:description,pictures_attributes: [:image])
  end
end
