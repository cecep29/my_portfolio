class PorfoliosController < ApplicationController
  def index 
    @portfolio_items = Porfolio.all
  end

  def new
    @portfolio_item = Porfolio.new
  end

  def create
    @portfolio_item = Porfolio.new(params.require(:porfolio).permit(:title, :subtitle, :body))

    if @portfolio_item.save
      redirect_to porfolios_path, notice: 'Your portfolio item is now live'
    else
      render 'new'
    end
  end

  def edit
    @portfolio_item = Porfolio.find(params[:id])
  end

  def update
    @portfolio_item = Porfolio.find(params[:id])
    @portfolio_item.update(params.require(:porfolio).permit(:title, :subtitle, :body))

    if @portfolio_item.save
      redirect_to porfolios_path, notice: 'Your portfolio item is now updated'
    else
      render 'edit'
    end
  end

  def show
    @portfolio_item = Porfolio.find(params[:id])
  end

  private
    def portfolio_params
      params.require(:porfolio).permit(:title, :subtitle, :body)
    end
end
