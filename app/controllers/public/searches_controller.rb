class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "brand_name"
      @contributors = Contributor.looks(params[:search], params[:word])
    else
      @items = Item.looks(params[:search], params[:word])
    end
  end

end
