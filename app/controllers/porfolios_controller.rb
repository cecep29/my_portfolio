class PorfoliosController < ApplicationController
  def index 
    @portfolio_items = Porfolio.all
  end
end
