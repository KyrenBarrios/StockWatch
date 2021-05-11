class StocksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @stock = @user.stocks.build
    else
      @stock = Stock.new
    end
    @stock.build_category
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
       @stocks = @user.stocks
    else
      @error = "That user doesn't exist" if params[:user_id]
      @stocks = Stock.includes(:category, :user)
    end

  end


  def create
    @stock = current_user.stocks.build(stock_params)
    if @stock.save
      redirect_to stocks_path
    else
      render :new
    end
  end


  def edit
    stock_find
    redirect_to stocks_path if !@stock || @stock.user != current_user
    @stock.build_category if !@stock.category
  end

  def update
    stock_find
     redirect_to stocks_path if !@stock || @stock.user != current_user
    if @stock.update(stock_params)
      redirect_to stock_path(@stock)
    else
      render :edit
    end
  end



  def show
    @stock = Stock.find_by_id(params[:id])
    redirect_to stocks_path if !@stock
  end

  def search 
    @stocks = Stock.search(params[:name])
    render :index
  end 

  def destroy
    @stock = Stock.find_by(id: params[:id])
    @stock.destroy
    redirect_to stocks_path
end




  private
  
  def stock_find
    @stock = Stock.find_by_id(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:name,:content, :price, :category_id, category_attributes:[:category_name])
  end

  
end