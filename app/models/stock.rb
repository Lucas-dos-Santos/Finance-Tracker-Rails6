class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = client_connect
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name,
          last_price: client.price(ticker_symbol))
    rescue StandardError
      nil
    end
  end

  def self.client_connect
    IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.publishable_token,
      secret_token: Rails.application.credentials.secret_token,
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
  end
end
