require_relative 'currency'

class CurrencyConverter
  attr_accessor :conversion_rates

  def initialize(rates=nil)
    if rates.nil?
      @conversion_rates = {
        'USD' => {
          'EUR' => 0.894726,
          'JPN' => 101.818,
          'USD' => 1
        },
        'EUR' => {
          'USD' => 1.11763,
          'JPN' => 113.774,
          'EUR' => 1
        },
        'JPN' => {
          'USD' => 0.00982184,
          'EUR' => 0.00879,
          'JPN' => 1
        }
      }
    else
      @conversion_rates = rates
    end
  end

  def convert(currency, to_code)
    conversion_rate = @conversion_rates[currency.code][to_code]
    amount = currency.amount * conversion_rate
    Currency.new(to_code, amount)
  end
end
