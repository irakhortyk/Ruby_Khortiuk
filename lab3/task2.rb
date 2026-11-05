cars_array = cars.to_a

puts "Індексний масив (масив пар):"
p cars_array

puts "\nПоелементний вивід індексного масиву:"
cars_array.each_with_index do |item, idx|
  puts "  [#{idx}] #{item[0]} => $#{item[1]}k"
end