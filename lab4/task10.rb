simple_lambda = -> { puts "Виклик lambda без параметрів" }
simple_lambda.call

strict_lambda = ->(x, y) { puts "x: #{x}, y: #{y}" }
strict_lambda.call(5, 10)

begin
  strict_lambda.call(5) 
rescue ArgumentError => e
  puts "Перехоплено помилку: #{e.message}"
end

def lambda_return_test
  my_lambda = -> { return "Значення з lambda" }
  res = my_lambda.call
  "Метод успішно продовжив роботу. Отримано: [#{res}]"
end

puts lambda_return_test