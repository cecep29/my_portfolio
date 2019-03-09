class PorfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:update, :edit, :show, :destroy]
  layout 'portfolio'

  def index 
    @portfolio_items = Porfolio.all 
  end

  def angular
    @angular_portfolio_items = Porfolio.angular
  end

  def new
    @portfolio_item = Porfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Porfolio.new(portfolio_params)

    if @portfolio_item.save
      redirect_to porfolios_path, notice: 'Your portfolio item is now live'
    else
      render 'new'
    end
  end

  def edit
 
  end

  def update
    @portfolio_item.update(portfolio_params)

    if @portfolio_item.save
      redirect_to porfolios_path, notice: 'Your portfolio item is now updated'
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @portfolio_item.destroy

    redirect_to porfolios_url, notice: "Record was removed."

  end

  private
    def portfolio_params
      params.require(:porfolio).permit(
                                        :title, 
                                        :subtitle, 
                                        :body, 
                                         technologies_attributes: [:name])
    end

    def set_portfolio_item
      @portfolio_item = Porfolio.find(params[:id])
    end
end
