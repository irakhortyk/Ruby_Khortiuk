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

shortest_names = cars.sort_by { |model, _| model.length }.first(3).to_h

puts "3 автомобілі з найкоротшими назвами моделей:"
shortest_names.each do |model, price|
  puts "  #{model} (довжина: #{model.length} симв.) — $#{price}k"
end