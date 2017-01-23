require 'currency_converter'

describe CurrencyConverter do

  describe '#new' do
    it 'returns CurrencyConverter object with a dictionary of conversions' do
    curr = CurrencyConverter.new({
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
  })

    expect(curr.conversion_rates).to eq 'USD' => {
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
    end
  end

  describe '#convert(currency, to_code)' do
    test_currency = Currency.new('USD', 10)
    test_converter = CurrencyConverter.new
    test_to_code = 'EUR'

    context 'when given a currency and code to convert to' do
      it 'returns a new currency object' do
        expect(test_converter.convert(test_currency, test_to_code)).to eq Currency.new('EUR', 8.94726)
      end
    end
  end


end
