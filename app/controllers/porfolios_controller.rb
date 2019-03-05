class PorfoliosController < ApplicationController
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
    @portfolio_item = Porfolio.find(params[:id])
  end

  def update
    @portfolio_item = Porfolio.find(params[:id])
    @portfolio_item.update(portfolio_params)

    if @portfolio_item.save
      redirect_to porfolios_path, notice: 'Your portfolio item is now updated'
    else
      render 'edit'
    end
  end

  def show
    @portfolio_item = Porfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Porfolio.find(params[:id])

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
end
