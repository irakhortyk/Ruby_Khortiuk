module Orbitable
  def orbit_period(distance_au)
    period = Math.sqrt(distance_au**3).round(2)
    "Час повного оберту по орбіті: ~#{period} земних років."
  end
end

class SpaceObject
  include Orbitable

  attr_accessor :name, :radius_km

  def initialize(name, radius_km)
    @name = name
    @radius_km = radius_km
  end

  def calculate_mass(density_kg_m3)
    volume_m3 = (4.0 / 3.0) * Math::PI * ((@radius_km * 1000)**3)
    mass = volume_m3 * density_kg_m3
    format('%.3e кг', mass)
  end

  def emit_light
    "#{@name} не виробляє власного світла, лише відбиває світло зорі."
  end

  def info
    "Об'єкт: #{@name}, Радіус: #{@radius_km} км"
  end

  protected

  def spectral_radiation(temperature_k)
    "Теплове випромінювання при #{temperature_k} K."
  end
end

class Star < SpaceObject
  attr_accessor :surface_temperature

  def initialize(name, radius_km, surface_temperature)
    super(name, radius_km)
    @surface_temperature = surface_temperature
  end

  def emit_light
    "#{@name} є джерелом термоядерного випромінювання. #{spectral_radiation(@surface_temperature)}"
  end

  def info
    "#{super}, Температура поверхні: #{@surface_temperature} K"
  end
end

class Planet < SpaceObject
  attr_accessor :has_atmosphere, :moons_count

  def initialize(name, radius_km, has_atmosphere: true, moons_count: 0)
    super(name, radius_km)
    @has_atmosphere = has_atmosphere
    @moons_count = moons_count
  end

  def info
    "#{super}, Супутників: #{@moons_count}, Наявність атмосфери: #{@has_atmosphere}"
  end
end

class Asteroid < SpaceObject
  attr_accessor :composition

  def initialize(name, radius_km, composition = 'камʼянистий')
    super(name, radius_km)
    @composition = composition
  end

  def hazard_check
    @radius_km > 0.1 ? 'Потенційно небезпечний обʼєкт!' : 'Безпечний розмір.'
  end
end

class Comet < SpaceObject
  attr_accessor :tail_length_km

  def initialize(name, radius_km, tail_length_km = 0)
    super(name, radius_km)
    @tail_length_km = tail_length_km
  end

  def emit_light
    "#{@name} світиться внаслідок іонізації газу в комі та хвості довжиною #{@tail_length_km} км."
  end
end


puts "=== 1. Створення об'єктів та робота методів ==="
sun = Star.new('Сонце', 696_340, 5778)
earth = Planet.new('Земля', 6371, has_atmosphere: true, moons_count: 1)
halley = Comet.new('Комета Галлея', 5.5, 100_000_000)
ceres = Asteroid.new('Церера', 473)

puts sun.info
puts sun.emit_light
puts "Маса Сонця: #{sun.calculate_mass(1408)}"
puts '---'
puts earth.info
puts earth.emit_light
puts earth.orbit_period(1.0)
puts "Маса Землі: #{earth.calculate_mass(5515)}"
puts '---'
puts halley.info
puts halley.emit_light
puts '---'
puts ceres.info
puts "Статус безпеки Церери: #{ceres.hazard_check}"

puts "\n=== 2. Робота із сеттерами/геттерами ==="
earth.moons_count = 2 
puts "Оновлена кількість супутників Землі: #{earth.moons_count}"

puts "\n=== 3. Перевизначення синглтон-методу для окремого екземпляра ==="
def ceres.emit_light
  'Церера тимчасово відбиває на 10% більше світла через яскраві плями карбонату натрію!'
end

puts ceres.emit_light