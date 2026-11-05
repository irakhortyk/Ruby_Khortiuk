def repeat_action
  puts " Початок виконання "
  yield if block_given?
  puts " Завершення виконання "
end

repeat_action { puts "Дія всередині блоку" }

def calculate_and_report(a, b)
  sum = a + b
  diff = a - b
  yield(sum, diff) if block_given?
end

calculate_and_report(20, 8) do |s, d|
  puts "Сума: #{s}, Різниця: #{d}"
end