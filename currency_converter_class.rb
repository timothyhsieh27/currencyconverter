require_relative "currency_class"

class DifferentCurrencyCodeError < StandardError
end

class UnknownCurrencyCodeError < StandardError
end

class CurrencyConverter
  attr_reader :currency_object :desired_code :new_currency

  def initialize()
    @conversion_rates = {
      'USD' => {'EUR' => 0.89, 'JPY' => 0.24}
      'EUR' => {'USD' => 1.118, 'JPY' => 113.774}
      'JPY' => {'USD' => 0.89, 'EUR => 0.24'}
    }
  end

  def convert_currency_code(currency_object, desired_code)
    code = currency_object.code
    amount = currency_object.amount
    if code == 'USD' || code == 'EUR' || code == 'JPY'
      conversion_rate = @conversion_rates[code][desired_code] #Creates an index of the subkey within the key. Will yield internal value.
      new_amount = conversion_rate * amount #Output of the converted amount. Used for creating the 'new_currency' object.
      new_currency = Currency.new(new_amount, desired_code) #Main output of this function.
      return new_currency
    else
      raise UnknownCurrencyCodeError, "Unkown currency code: unable to process conversion."
  end

end
