class User
  def full_name(first, last)
    "#{first} #{last}"
  end

  alias name full_name
  alias get_name full_name
end

user = User.new
puts user.full_name("Іван", "Франко")
puts user.name("Тарас", "Шевченко")
puts user.get_name("Леся", "Українка")