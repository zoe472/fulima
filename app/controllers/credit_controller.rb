class CreditController < ApplicationController
  require "payjp"
  before_action :get_payjp_info,only: [:pay, :delete, :show]

  def new
  end

  def pay
    if params['payjp_token'].blank?
      redirect_to action: :new
    else
      customer = Payjp::Customer.create(
      description: 'test', 
      email: current_user.email,
      card: params['payjp_token'], 
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: :index
      else
        redirect_to action: :new
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: :index
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: :index
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end


  def index
    card = Card.where(user_id: current_user.id).first
    redirect_to action: :show,id:current_user.id if card.present?
  end

 

  private
  
  def get_payjp_info
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  end
end
