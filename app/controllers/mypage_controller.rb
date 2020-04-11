class MypageController < ApplicationController

  def index 
  end

  def purchace
  end

  def sell
  end

  def profile
  end

  def logout
  end

  def mail
  end

  def sample
    @post = Item.find(params[:id])
  end

  def destroy
    @post = Item.find(params[:id])
    @post.delete
  end
  def sample2
  end
  
end
