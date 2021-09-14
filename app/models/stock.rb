class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true
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
      endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

  def self.check_db(ticker)
    where(ticker: ticker).first
  end

  def self.top_10
    client = client_connect
    client.stock_market_list(:mostactive)
  end
end
