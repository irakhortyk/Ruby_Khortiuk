def transform_numbers(numbers, &transformer)
  result = []
  numbers.each do |num|
    result << transformer.call(num) if block_given?
  end
  result
end

nums = [1, 2, 3, 4]
squared = transform_numbers(nums) { |x| x**2 }
cubed   = transform_numbers(nums) { |x| x**3 }

puts "Початковий: #{nums.inspect}"
puts "Квадрати: #{squared.inspect}"
puts "Куби: #{cubed.inspect}"