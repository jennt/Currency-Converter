class DifferentCurrencyCodeError < StandardError
end

class Currency
  attr_accessor :amount, :code

  def initialize(code, amount= nil)
    codes = {"$"=> 'USD', "€"=> 'EUR', "¥"=> 'JPN'}

    if amount != nil
      @amount = amount
      @code = code
    else
      symbol = code[0]
      @code = codes[symbol]
      @amount = code[1..-1].to_f
    end
  end

  def equal_to?(curr)
    if self.amount == curr.amount && self.code == curr.code
      true
    else
      false
    end
  end

  def + (curr)
    if curr.code != @code
      raise DifferentCurrencyCodeError
    else
      Currency.new(code, @amount + curr.amount)
    end
  end

  def - (curr)
    if curr.code != @code
      raise DifferentCurrencyCodeError
    else
      Currency.new(code, @amount - curr.amount)
    end
  end

  def *(factor)
    if factor.is_a? Float or factor.is_a? Integer
      @amount *= factor
    #else
      #factor = Currency.new()
      #need to deal with curr object given with symbol and amount
    end
  end

end

# Currency() must be able to take one argument with a currency symbol embedded in it, like "$1.20" or "€ 7.00", and figure out the correct currency code. It can also take two arguments, one being the amount and the other being the currency code.
