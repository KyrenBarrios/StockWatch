module StocksHelper
  def index_display_header
    if @user
      content_tag(:h1, "#{@user.username}'s Stocks:")
    else
      content_tag(:h2, "All Stocks")
    end
  end

  def display_stocks
    if @user.stocks.empty?
      tag.h2(link_to('No stocks yet - write a stock post here', new_stock_path))
    else
      user = @user == current_user ? 'Your' : "#{@user.username}'s"
      content_tag(:h2, "#{user} #{pluralize(@user.stocks.count, 'Stock')}:")

    end
  end
end

