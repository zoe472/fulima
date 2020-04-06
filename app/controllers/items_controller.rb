class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:seller).order("created_at DESC").page(params[:page]).per(3)
    @random = Item.includes(:seller).order("RAND()").limit(3)
  end


  def new
    
  end
  def hoge
  end
  def hige
  end
  def huge
  end
end
