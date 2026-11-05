def greet(name:, age: nil, city: "Unknown")
  age_str = age ? "#{age} р." : "вік не вказано"
  puts "Користувач: #{name} | Вік: #{age_str} | Місто: #{city}"
end

greet(name: "Олексій")

greet(city: "Київ", age: 22, name: "Марія")