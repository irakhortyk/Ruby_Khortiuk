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

missing_price_models = cars.select { |_model, price| price.nil? || price == 0 }.keys

if missing_price_models.empty?
  puts "Усі автомобілі мають встановлену вартість."
else
  puts "Виявлено автомобілі без ціни: #{missing_price_models.join(', ')}"
  missing_price_models.each do |model|
    loop do
      print "Введіть ціну (у тис. $) для '#{model}': "
      input = gets.chomp
      if input.match?(/^\d+(\.\d+)?$/) && input.to_f > 0
        cars[model] = input.to_f == input.to_i ? input.to_i : input.to_f
        break
      else
        puts "Помилка: введіть коректне додатне число."
      end
    end
  end
end

puts "\nОновлений список автомобілів:"
cars.each { |model, price| puts "  #{model}: $#{price}k" }