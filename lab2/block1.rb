def sum_negative_control(arr)
  sum = 0
  i = 0
  while i < arr.length
    sum += arr[i] if arr[i] < 0
    i += 1
  end
  sum
end

def sum_negative_iterators(arr)
  arr.select { |x| x < 0 }.sum
end

def max_indices_control(arr)
  return [] if arr.empty?

  max_val = arr[0]
  i = 1
  until i >= arr.length
    max_val = arr[i] if arr[i] > max_val
    i += 1
  end

  indices = []
  j = 0
  while j < arr.length
    indices << j if arr[j] == max_val
    j += 1
  end
  indices
end

def max_indices_iterators(arr)
  return [] if arr.empty?
  max_val = arr.max
  arr.each_with_index.filter_map { |val, idx| idx if val == max_val }
end

puts "БЛОК 1. ОДНОВИМІРНІ МАСИВИ"

puts "\n Завдання 2. Знайти суму від'ємних елементів масиву"
numbers1 = [12, -7, 5, -3, 0, -18, 9]
puts "Вхідний масив: #{numbers1.inspect}"
puts "Спосіб 1 (керуючі конструкції): #{sum_negative_control(numbers1)}"
puts "Спосіб 2 (ітератор): #{sum_negative_iterators(numbers1)}"

puts "\n Завдання 3. Знайти усі індекси максимального елемента масиву"
numbers2 = [4, 9, 2, 9, 1, 9, 5]
puts "Вхідний масив: #{numbers2.inspect}"
puts "Спосіб 1 (керуючі конструкції): #{max_indices_control(numbers2).inspect}"
puts "Спосіб 2 (ітератор): #{max_indices_iterators(numbers2).inspect}"