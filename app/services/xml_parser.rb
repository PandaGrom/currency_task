class XmlParser < ApplicationService
  def initialize(xml_response)
    @xml_doc = Hash.from_xml(xml_response)
  end

  def call
    parse_currency_rates
  end
  
  def parse_currency_rates    
    CurrencyRate::CURRENCY_CODE.map do |currency_internal, currency_external|
      rate = @xml_doc.dig('ValCurs', 'Valute').find do |valute|
        valute['CharCode'] == currency_external
      end['Value']

      { currency_code: currency_internal, rate: rate }
    end
  end
end
