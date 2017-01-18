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

    expect(curr.conv_rates).to eq 'USD' => {
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

# describe '#convert' do
#   context ''
# end


end
