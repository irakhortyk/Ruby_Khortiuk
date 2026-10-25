puts " Завдання 1: Переведення літрів у метри кубічні "

LITERS_IN_CUBIC_METER = 1000.0
CUBIC_METERS_PER_LITER = 0.001

def liters_to_m3_div(liters)
  liters.to_f / LITERS_IN_CUBIC_METER
end

def liters_to_m3_mul(liters)
  liters.to_f * CUBIC_METERS_PER_LITER
end

test_liters = [500, 1000, 2500, 120]

puts "Спосіб 1 (ділення на константу):"
test_liters.each do |liters|
  puts "#{liters} л = #{liters_to_m3_div(liters)} м³"
end

puts "\nСпосіб 2 (множення на зворотний коефіцієнт):"
test_liters.each do |liters|
  puts "#{liters} л = #{liters_to_m3_mul(liters)} м³"
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

puts "Початковий список рядків:"
puts strings.map { |s| "  - \"#{s}\"" }

result_way1 = strings.select do |str|
  str.strip.split(/\s+/).size > 2
end

result_way2 = strings.reject do |str|
  str.strip.split(/\s+/).size <= 2
end

puts "\nСпосіб 1 (select):"
puts result_way1.map { |s| "  -> \"#{s}\"" }

puts "\nСпосіб 2 (reject):"
puts result_way2.map { |s| "  -> \"#{s}\"" }

puts " "
puts " Завдання 3: Зсув елементів масиву вліво на 1 позицію "

original_array = [10, 20, 30, 40, 50]
puts "Оригінальний масив: #{original_array.inspect}"

shifted_way1 = original_array.rotate(1)
puts "Спосіб 1 (rotate(1)):    #{shifted_way1.inspect}"

arr_copy = original_array.dup
first_elem = arr_copy.shift
arr_copy.push(first_elem)
puts "Спосіб 2 (shift + push): #{arr_copy.inspect}"

puts " "
puts " Завдання 4: Формування списку для закупівлі товарів "

warehouse = [
  { title: "Ноутбук", quantity: 5, min_quantity: 10 },
  { title: "Мишка", quantity: 25, min_quantity: 15 },
  { title: "Клавіатура", quantity: 4, min_quantity: 8 },
  { title: "Монітор", quantity: 12, min_quantity: 12 },
  { title: "Навушники", quantity: 2, min_quantity: 6 }
]

to_order_1 = warehouse
  .select { |item| item[:quantity] < item[:min_quantity] }
  .map do |item|
    {
      title: item[:title],
      current: item[:quantity],
      min_needed: item[:min_quantity],
      to_buy: item[:min_quantity] - item[:quantity]
    }
  end

to_order_2 = warehouse.each_with_object([]) do |item, list|
  if item[:quantity] < item[:min_quantity]
    list << {
      title: item[:title],
      current: item[:quantity],
      min_needed: item[:min_quantity],
      to_buy: item[:min_quantity] - item[:quantity]
    }
  end
end

puts "Спосіб 1 (select + map):"
to_order_1.each_with_index do |item, idx|
  puts "#{idx + 1}. #{item[:title]} — Докупити: #{item[:to_buy]} шт."
end

puts "\nСпосіб 2 (each_with_object):"
to_order_2.each_with_index do |item, idx|
  puts "#{idx + 1}. #{item[:title]} — Докупити: #{item[:to_buy]} шт."
end