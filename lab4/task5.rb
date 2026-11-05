def analyze_scores(subject, *scores)
  puts "Предмет: #{subject}"
  puts "Отримані оцінки: #{scores.inspect}"
  average = scores.empty? ? 0 : (scores.sum.to_f / scores.size).round(2)
  puts "Середній бал: #{average}"
end

analyze_scores("Математика", 85, 92, 78, 95)
analyze_scores("Фізика", 100, 90)