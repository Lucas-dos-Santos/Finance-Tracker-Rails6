class WelcomeController < ApplicationController
  def index
    @top10 = Stock.top_10
  end
end
