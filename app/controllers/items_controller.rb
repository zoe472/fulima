class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:seller).order("created_at DESC").limit(3)
    @random = Item.includes(:seller).order("RAND()").limit(3)
  end

  def newindex
    @items = Item.includes(:seller).page(params[:page]).per(3).order("created_at DESC")
  end

end
