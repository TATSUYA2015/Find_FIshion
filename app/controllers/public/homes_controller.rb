class Public::HomesController < ApplicationController
  def top
    @contributors=Contributor.page(params[:page])
  end

  def about
  end

end
