def even_and_positive?(number)
  number.even? && number > 0
end

def adult?(age)
  age >= 18
end

puts "4 парне та додатнє? #{even_and_positive?(4)}"
puts "-2 парне та додатнє? #{even_and_positive?(-2)}"
puts "Вік 17 повнолітній? #{adult?(17)}"
puts "Вік 20 повнолітній? #{adult?(20)}"