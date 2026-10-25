puts " Завдання 1: Переведення літрів у метри кубічні "

def liters_to_cubic_meters(liters)
  liters.to_f / 1000.0
end

test_liters = [500, 1000, 2500, 120]
test_liters.each do |liters|
  m3 = liters_to_cubic_meters(liters)
  puts "#{liters} л = #{m3} м³"
end

puts " "
puts " Завдання 2: Рядки, які містять більше двох слів "

strings = [
  "Ruby",
  "Привіт світ",
  "Вивчення мови програмування Ruby",
  "Лабораторна робота номер один",
  "Два слова",
  "Один два три"
]

result_strings = strings.select do |str|
  str.strip.split(/\s+/).size > 2
end

puts "Початковий список рядків:"
puts strings.map { |s| "  - \"#{s}\"" }
puts "\nРядки, що містять більше ніж 2 слова:"
puts result_strings.map { |s| "  -> \"#{s}\"" }

puts " "
puts " Завдання 3: Зсув елементів масиву вліво на 1 позицію "

original_array = [10, 20, 30, 40, 50]
puts "Оригінальний масив: #{original_array.inspect}"

shifted_method1 = original_array.rotate(1)
puts "Спосіб 1 (rotate(1)):       #{shifted_method1.inspect}"

shifted_method2_slice = original_array[1..] + [original_array[0]]
puts "Спосіб 2 (через зрізи):     #{shifted_method2_slice.inspect}"

arr_copy = original_array.dup
first_element = arr_copy.shift 
arr_copy.push(first_element)
puts "Спосіб 2 (shift + push):    #{arr_copy.inspect}"

puts " "
puts " Завдання 4: Формування списку для закупівлі товарів "

warehouse = [
  { title: "Ноутбук", quantity: 5, min_quantity: 10 },
  { title: "Мишка", quantity: 25, min_quantity: 15 },
  { title: "Клавіатура", quantity: 4, min_quantity: 8 },
  { title: "Монітор", quantity: 12, min_quantity: 12 },
  { title: "Навушники", quantity: 2, min_quantity: 6 }
]

to_order = warehouse
  .select { |item| item[:quantity] < item[:min_quantity] }
  .map do |item|
    needed = item[:min_quantity] - item[:quantity]
    {
      title: item[:title],
      current: item[:quantity],
      min_needed: item[:min_quantity],
      to_buy: needed
    }
  end

puts "Товари, які потребують замовлення на склад:"
to_order.each_with_index do |item, idx|
  puts "#{idx + 1}. #{item[:title]} — у наявності: #{item[:current]} шт., мінімум: #{item[:min_needed]} шт. (Докупити: #{item[:to_buy]} шт.)"
end