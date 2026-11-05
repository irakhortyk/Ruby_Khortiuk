def calculate_price(base_price, tax_rate = 0.20, discount = 0.0)
  final_price = (base_price * (1 + tax_rate)) - discount
  puts "Базова: #{base_price}, Податок: #{tax_rate * 100}%, Знижка: #{discount} -> Разом: #{final_price}"
end

calculate_price(1000)
calculate_price(1000, 0.05, 50)

class BaseNotifier
  def send_message(text)
    "Базове сповіщення: #{text}"
  end
end

class EmailNotifier < BaseNotifier

  def send_message(text)
    parent_result = super(text)
    "#{parent_result} (відправлено на пошту)"
  end
end

base = BaseNotifier.new
email = EmailNotifier.new

puts base.send_message("Привіт!")
puts email.send_message("Привіт!")