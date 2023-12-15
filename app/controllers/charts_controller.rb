class ChartsController < ApplicationController
  def index
    render json: CurrencyRate.where('date > ?', 1.month.ago).group_by(&:currency_code).map { |code, values| [code, *values.sort_by(&:date).map(&:rate)]}
  end

  def show

  end
end
