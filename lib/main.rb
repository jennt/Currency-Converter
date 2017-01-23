require_relative 'currency'
require_relative 'currency_converter'

def main
  print "Enter currency to convert: "
  currency = gets.chomp

  currency = Currency.new(currency)
  puts "Your currency is #{currency}"

  puts "What would you like to convert it to: "
  to_code = gets.chomp

  converter = CurrencyConverter.new
  puts "Lets convert #{currency} to #{to_code}"

  converted_currency = converter.convert(currency, to_code)

  puts "Your converted currency = #{converted_currency}"

end

main if __FILE__ == $PROGRAM_NAME
