class Currency
# attr_reader :@amount, :@usd, :@eur, :@jpy
  def initialize(amount, currency_code) #makes a money
    @amount = amount
    @currencycode = currency_code

    puts "Enter amount of currency: "
    amount = gets.to_i
    return amount

    puts "Enter 3-letter currency code: "
    currency_code = gets.downcase
    return currency_code

    puts "You have #{@amount} #{@currency_code} ready for calculation or conversion."
  end

  def money(amount, usd, eur, jpy)
    @amount = amount
    @usd = usd
    @eur = eur
    @jpy = jpy
  end

  def select_

end
