class ItemsController < ApplicationController
  
  def index
    @item = Item.includes(:user)
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
