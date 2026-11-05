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

print "Введіть назву моделі для пошуку: "
search_query = gets.chomp

found_pair = cars.find { |model, _| model.casecmp?(search_query) }

if found_pair
  model, price = found_pair
  puts "Знайдено: #{model}. Вартість: $#{price}k"
else
  puts "Модель '#{search_query}' в автосалоні відсутня."
end