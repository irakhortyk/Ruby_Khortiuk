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

cheapest_nonzero = cars.select { |_model, price| price && price > 0 }
                       .sort_by { |_model, price| price }
                       .first(5)
                       .to_h

puts "5 найдешевших автомобілів з ненульовою ціною:"
cheapest_nonzero.each do |model, price|
  puts "  #{model}: $#{price}k"
end