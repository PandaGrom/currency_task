class CurrencyRate < ApplicationRecord
  CURRENCY_CODE = { usd: 'USD', eur: 'EUR', cny: 'CNY' }
  enum :currency_code, CURRENCY_CODE.keys
end
