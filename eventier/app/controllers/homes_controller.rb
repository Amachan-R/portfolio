class HomesController < ApplicationController

  def top
    @events = Event.page(params[:page]).per(8).reverse_order
  end

end
