require 'currency'

describe Currency do

  describe '#new' do
    context 'when amount and code are separate' do
      it 'returns currency with amount and code' do
        curr1 = Currency.new('USD', 10)

        expect(curr1.amount).to eq 10
        expect(curr1.code).to eq 'USD'

      end
    end

    context 'when symbol is embedded in the amount' do
      it 'returns currency with amount and code' do
        curr1 = Currency.new('$20.00')

        expect(curr1.amount).to eq 20.00
        expect(curr1.code).to eq 'USD'

      end
    end
  end

  describe '#equal_to?' do
    it 'returns true when amounts and codes match' do
      curr1 = Currency.new('USD', 10)
      curr2 = Currency.new('USD', 10)

      expect(curr1.equal_to?(curr2)).to eq true

    end

    it 'returns false when amount does not match' do
      curr1 = Currency.new('USD', 10)
      curr2 = Currency.new('USD', 20)

      expect(curr1.equal_to?(curr2)).to eq false
    end

    it 'returns false when code does not match' do
      curr1 = Currency.new('USD', 10)
      curr2 = Currency.new('EUR', 10)

      expect(curr1.equal_to?(curr2)).to eq false
    end
  end

  describe '#+' do
    context 'when currency codes are the same' do
      it 'returns a new currency object with combined amounts' do
        # Arrange
        curr1 = Currency.new('USD', 10)
        curr2 = Currency.new('USD', 11)
        # Act
        curr3 = curr1 + curr2
        # Assert
        expect(curr3.amount).to eq 21
        expect(curr3.code).to eq 'USD'
      end
    end

    context 'when currency codes are different' do
      it 'raises +Error when codes are not the same' do
        curr1 = Currency.new('EUR', 10)
        curr2 = Currency.new('USD', 10)

        expect { curr1 + curr2 }.to raise_error DifferentCurrencyCodeError
      end
    end
  end

  describe '#-' do
    context 'when currency codes are the same' do
      it 'returns a new currency object with combined amounts' do
        # Arrange
        curr1 = Currency.new('USD', 15)
        curr2 = Currency.new('USD', 5)
        # Act
        curr3 = curr1 - curr2
        # Assert
        expect(curr3.amount).to eq 10
        expect(curr3.code).to eq 'USD'
      end
    end

    context 'when currency codes are different' do
      it 'raises -Error when codes are not the same' do
        curr1 = Currency.new('EUR', 10)
        curr2 = Currency.new('USD', 10)

        expect { curr1 - curr2 }.to raise_error DifferentCurrencyCodeError
      end
    end
  end

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

  # describe '#currency' do
  #   context 'when given one argument containing symbol and amount' do
  #     it 'returns correct currency code' do
  #       curr = "$1.20"
  #
  #       expect(currency(input)).to eq 'USD'
  #     end
  #   end

    # context 'when given two arguments (symbol and amount separatly)' do
    #   it 'returns correct currency code' do
    #
    #   end
    # end
  #  end
end
