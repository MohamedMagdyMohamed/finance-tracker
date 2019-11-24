class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)
    StockQuote::Stock.new(api_key: 'pk_41825fda1b0b44508945e4e418d247d6')
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
    rescue Exception => e
      return nil
    end
  end

end
