class DifferentCurrencyCodeError < StandardError
end

class Currency
  attr_accessor :amount, :code

  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def equals?(curr)
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
      Currency.new(@amount + curr.amount, code)
    end
  end

  def - (curr)
    if curr.code != @code
      raise DifferentCurrencyCodeError
    else
      Currency.new(@amount - curr.amount, code)
    end
  end

  def * (int_or_float)
    @amount * int_or_float
  end

  # def currency(input) #code w/ symbol OR code then symbol
  #   'USD'
  # end
  #return correct code

  # def symbol?
  #   if  amount.chars.first == "$" then @code = USD
  #     if  amount.chars.first == "€" then @code = EUR
  #       if  amount.chars.first == "¥" then @code = JPN
  #       end
  #     end
  #   end
  # end

end

# Currency() must be able to take one argument with a currency symbol embedded in it, like "$1.20" or "€ 7.00", and figure out the correct currency code. It can also take two arguments, one being the amount and the other being the currency code.
