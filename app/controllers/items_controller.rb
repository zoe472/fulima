class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:seller).order("created_at DESC").limit(3)
    @random = Item.includes(:seller).order("RAND()").limit(3)
  end

  def newindex
  end

end
