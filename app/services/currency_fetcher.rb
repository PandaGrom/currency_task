class CurrencyFetcher < ApplicationService
  include HTTParty
  base_uri 'https://www.cbr.ru/scripts/XML_daily.asp'

  def initialize(date)
    @date = date
    @options = { query: { date_req: date.strftime('%d/%m/%Y') } }
  end

  def call
    response = self.class.get('', @options)
    parse_and_save(response)
  end

  private

  def parse_and_save(response)
    currency_rates = XmlParser.call(response.body)

    currency_rates.each do |currency_rate|
      CurrencyRate.create!(
        date: @date,
        currency_code: currency_rate[:currency_code],
        rate: currency_rate[:rate].gsub(',', '.').to_f.round(2)
      )
    end
  end
end
