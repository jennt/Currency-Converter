require 'currency'

describe Currency do
  describe '#new' do
    it 'returns currency with amount and code' do
      curr1 = Currency.new(10, 'USD')

      expect(curr1.amount).to eq 10
      expect(curr1.code).to eq 'USD'

    end
  end

  describe '#equal?' do
    it 'returns true when amounts and codes match' do
      curr1 = Currency.new(10, 'USD')
      curr2 = Currency.new(10, 'USD')

      expect(curr1.equals?(curr2)).to eq true

    end

    it 'returns false when amount does not match' do
      curr1 = Currency.new(10, 'USD')
      curr2 = Currency.new(20, 'USD')

      expect(curr1.equals?(curr2)).to eq false
    end

    it 'returns false when code does not match' do
      curr1 = Currency.new(10, 'USD')
      curr2 = Currency.new(10, 'EUR')

      expect(curr1.equals?(curr2)).to eq false
    end
  end

  describe '#+' do
    context 'when currency codes are the same' do
      it 'returns a new currency object with combined amounts' do
        # Arrange
        curr1 = Currency.new(10, 'USD')
        curr2 = Currency.new(11, 'USD')
        # Act
        curr3 = curr1 + curr2
        # Assert
        expect(curr3.amount).to eq 21
        expect(curr3.code).to eq 'USD'
      end
    end

    context 'when currency codes are different' do
      it 'raises +Error when codes are not the same' do
        curr1 = Currency.new(10, 'EUR')
        curr2 = Currency.new(10, 'USD')

        expect { curr1 + curr2 }.to raise_error DifferentCurrencyCodeError
      end
    end
  end

  describe '#-' do
    context 'when currency codes are the same' do
      it 'returns a new currency object with combined amounts' do
        # Arrange
        curr1 = Currency.new(15, 'USD')
        curr2 = Currency.new(5, 'USD')
        # Act
        curr3 = curr1 - curr2
        # Assert
        expect(curr3.amount).to eq 10
        expect(curr3.code).to eq 'USD'
      end
    end

    context 'when currency codes are different' do
      it 'raises -Error when codes are not the same' do
        curr1 = Currency.new(10, 'EUR')
        curr2 = Currency.new(10, 'USD')

        expect { curr1 - curr2 }.to raise_error DifferentCurrencyCodeError
      end
    end
  end

  describe '#*' do
    it 'returns a new currency object when multiplied by a float' do
      curr = Currency.new(10, 'EUR')
      curr.amount = curr * 2.0

      expect(curr.amount).to eq 20.0
    end

    it 'returns a new currency object when multiplied by an integer' do
      curr = Currency.new(10, 'EUR')
      curr.amount = curr * 2

      expect(curr.amount).to eq 20
    end
  end

  # describe '#currency' do
  #   context 'when given one argument containing symbol and amount' do
  #     it 'returns correct currency code' do
  #       input = "$1.20"
  #
  #       expect(currency(input)).to eq 'USD'
  #     end
  #   end

    # context 'when given two arguments (symbol and amount separatly)' do
    #   it 'returns correct currency code' do
    #
    #   end
    # end
  # end
end
