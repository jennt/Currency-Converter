class DifferentCurrencyCodeError < StandardError
end

class Currency
  attr_accessor :amount, :code

  def initialize(code, amount=nil)
    codes = {"$"=> 'USD', "€"=> 'EUR', "¥"=> 'JPN'}

    unless amount.nil?
      @amount = amount
      @code = code
    else
      symbol = code[0]
      @code = codes[symbol]
      @amount = code[1..-1].to_f
    end
  end

  def ==(curr)
    @amount == curr.amount && @code == curr.code
  end

  def +(curr)
    if curr.code != @code
      raise DifferentCurrencyCodeError
    else
      Currency.new(@code, @amount + curr.amount)
    end
  end

  def -(curr)
    if curr.code != @code
      raise DifferentCurrencyCodeError
    else
      Currency.new(@code, @amount - curr.amount)
    end
  end

  def *(factor)
    if factor.is_a? Float or factor.is_a? Integer
      Currency.new(@code, @amount * factor)
    end
  end

  def to_s
    "#{@code} #{@amount}"
  end
end
