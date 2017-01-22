## Currency Converter
(underdevelopment)

Ruby command line program used to convert currency objects.

# Code Sample
```Ruby
def - (curr)
  if curr.code != @code
    raise DifferentCurrencyCodeError
  else
    Currency.new(code, @amount - curr.amount)
  end
end
```

# Tests

Tests written with RSpec version 3.5.4
```Ruby
describe '#*' do
  it 'returns a new currency object when multiplied by a float' do
    curr = Currency.new('EUR', 10)
    curr.amount = curr * 2.0

    expect(curr.amount).to eq 20.0
  end

  it 'returns a new currency object when multiplied by an integer' do
    curr = Currency.new('EUR', 10)
    curr.amount = curr * 2

    expect(curr.amount).to eq 20
  end
end
```

# Built With

Ruby 2.3.1

# Authors

Jenn Tustin

# Acknowledgments
