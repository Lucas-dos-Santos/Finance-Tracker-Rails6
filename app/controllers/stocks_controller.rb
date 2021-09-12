class StocksController < ApplicationController
  def search
    @results = Stock.new_lookup(params[:stock])
  end
end
