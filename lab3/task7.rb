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

total_cost = cars.values.compact.sum

puts "Загальна вартість усіх авто в автосалоні: $#{total_cost}k ($#{total_cost * 1000})"