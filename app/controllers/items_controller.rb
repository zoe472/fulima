class ItemsController < ApplicationController
  before_action :set_item, only: [:sample, :sample2, :purchace, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :purchace]
 
  
  def index
    @items = Item.includes(:seller).order("created_at DESC").limit(3)
    @random = Item.includes(:seller).order("RAND()").limit(3)
    @parents = Category.all.order("id ASC").limit(13)
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

  def edit
  end

  def update
    if @item.update(item_update_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(@item)
    end
  end


  def sample
    @categry = @item.categories.flat_map(&:name)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def sample2
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    @card = Card.find_by(user_id: current_user.id)
    @address = Address.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to controller: :credit, action: :new
    else
      @categry = @item.categories.flat_map(&:name)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def purchace
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



  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to action: 'sample'
    end
  end

  def search
    @keyword = params[:keyword]
    @items = Item.search(params[:keyword]).page(params[:page]).per(20).order("created_at DESC")
  end

private

  def item_params
    params.require(:item).permit(:name, :description, :size, :status, :charge, :region, :price, :date, :brand, pictures_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name, :description, :size, :status, :charge, :region, :price, :date, :brand,[pictures_attributes: [:image, :_destroy, :id]]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end


  

