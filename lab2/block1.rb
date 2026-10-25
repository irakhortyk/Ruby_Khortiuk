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

numbers1 = [12, -7, 5, -3, 0, -18, 9]
puts sum_negative_control(numbers1)
puts sum_negative_iterators(numbers1)

numbers2 = [4, 9, 2, 9, 1, 9, 5]
p max_indices_control(numbers2)
p max_indices_iterators(numbers2)