class Public::HomesController < ApplicationController
  def top
    @contributors=Contributor.active.page(params[:page])
  end

  def about
  end

end
