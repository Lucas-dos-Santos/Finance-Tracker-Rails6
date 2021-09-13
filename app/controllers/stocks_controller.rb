class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        @stocker = Stock.client_connect
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash.now[:alert] = "Não foi encontrado nenhuma ação com o codigo: #{params[:stock].upcase}"
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      end
    else
      flash.now[:alert] = 'Por favor entre com um codigo para pesquisar'
      respond_to do |format|
        format.js { render partial: 'users/result' }
      end
    end
  end
end
