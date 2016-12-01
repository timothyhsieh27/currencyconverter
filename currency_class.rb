class Currency
  attr_accessor :amount, :code

  def initialize(amount, code)
    @amount = amount.to_f
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
      raise DifferentCurrencyCodeError, "Currency codes do not match."
    end
  end

  def -(other)
    if @code == other.code
      Currency.new(@amount - other.amount, @code)
    else
      raise DifferentCurrencyCodeError, "Currency codes do not match."
    end
  end

  def *(other)
    if @code == other.code
      Currency.new(@amount * other.amount, @code)
    else
      raise DifferentCurrencyCodeError, "Currency codes do not match."
    end
  end

  def choose_code(amount)
      if @amount[0] == '$'
        @code = 'USD'
        @amount = amount[1..-1].to_f
      elsif amount[0] == '€'
        @code = 'EUR'
        @amount = amount[1..-1].to_f
      elsif amount[0] == '¥'
        @code = 'JPY'
        @amount = amount[1..-1].to_f
      else
        raise UnrecognizedCurrencyError, "Invalid input. Please reenter data."
    end
  end
end

class DifferentCurrencyCodeError < StandardError
  raise DifferentCurrencyCodeError, "Different currency code: unable to process conversion."
end

class UnrecognizedCurrencyError < StandardError
  raise UnrecognizedCurrencyCodeError, "Unrecognized currency code: unable to process conversion."
end

one_dollar = Currency.new(1, 'USD')
two_dollar = Currency.new(2, 'USD')
