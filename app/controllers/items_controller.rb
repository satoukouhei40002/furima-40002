class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def create

  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
