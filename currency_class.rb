class DifferentCurrencyCodeError < StandardError
end

class Currency
  attr_reader :amount, :currency_code

  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
    self.amount == other.amount && self.code == other.code
  end

  def !=(other)
    self.amount != other.amount || self.code != other.code
  end

  def +(other)
    if @code == other.code
      Currency.new(@amount + other.amount, @code)
    else
      raise DifferentCurrencyCodeError, "Currency codes do not match!"
    end
  end

  def -(other)
    if @code == other.code
      Currency.new(@amount - other.amount, @code)
    else
      raise DifferentCurrencyCodeError, "Currency codes do not match!"
    end
  end

  def *(other)
    if @code == other.code
      Currency.new(@amount * other.amount, @code)
    else
      raise DifferentCurrencyCodeError, "Currency codes do not match!"
    end
  end

  def /(other)
    if @code == other.code
      Currency.new(@amount / other.amount, @code)
    else
      raise DifferentCurrencyCodeError, "Currency codes do not match!"
    end
  end

end
