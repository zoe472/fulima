class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:seller).order("created_at DESC").limit(3)
    @random = Item.includes(:seller).order("RAND()").limit(3)
  end


  def new
    
  end

  def sample
    @item = Item.find(params[:id])
    @categry = @item.categories.flat_map(&:name)
  end

  def sample2
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    @card = Card.find_by(user_id: current_user.id)
    @address = Address.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to controller: :credit, action: :new
    else
      @item = Item.find(params[:id])
      @categry = @item.categories.flat_map(&:name)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def purchace
    @item = Item.find(params[:id])
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id,
    currency: 'jpy'
    )
    @item_buyer = Item.find(params[:id])
    @item_buyer.update( buyer_id: current_user.id)
    redirect_to action: 'finish' #完了画面に移動
  end

  def finish
  end
  
  def newindex
    @items = Item.includes(:seller).page(params[:page]).per(20).order("created_at DESC")
  end

end
