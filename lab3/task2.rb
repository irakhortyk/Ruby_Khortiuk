cars = {
  "BMW M3"         => 75,
  "Audi TT"        => 45,
  "Kia Rio"        => 18,
  "Mazda 3"        => 22,
  "Ford Mustang"   => 55,
  "Mini"           => 28,
  "Porsche 911"    => 120,
  "Toyota Corolla" => 0,
  "Tesla Model S"  => 90,
  "Lada Niva"      => 0
}

cars_array = cars.to_a

puts "Індексний масив (масив пар):"
p cars_array

puts "\nПоелементний вивід індексного масиву:"
cars_array.each_with_index do |item, idx|
  puts " [#{idx}] #{item[0]} => $#{item[1]}k"
end