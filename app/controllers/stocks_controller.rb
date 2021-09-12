class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash[:alert] = "Não foi encontrado nenhuma ação com o codigo: #{params[:stock]}"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = 'Por favor entre com o codigo para pesquisar'
      redirect_to my_portfolio_path
    end
  end
end
