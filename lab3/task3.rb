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

puts "Оберіть критерій сортування:"
puts "1 — за назвою моделі (за алфавітом)"
puts "2 — за ціною (за зростанням)"
print "Ваш вибір (1 або 2): "

choice = gets.chomp

sorted_cars = case choice
              when "1"
                cars.sort_by { |model, _price| model.downcase }.to_h
              when "2"
                cars.sort_by { |_model, price| price }.to_h
              else
                puts "Невірний вибір. Сортування за замовчуванням (за назвою)."
                cars.sort.to_h
              end

puts "\nРезультат сортування:"
sorted_cars.each { |model, price| puts "  #{model} — $#{price}k" }