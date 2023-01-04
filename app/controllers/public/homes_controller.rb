class Public::HomesController < ApplicationController
  def top
    @contributors=Contributor.all
  end

  def about
  end

end
