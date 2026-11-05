class BankAccount
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def +(amount)
    BankAccount.new(@balance + amount)
  end

  def balance=(value)
    if value < 0
      puts "Помилка: баланс не може бути від'ємним!"
    else
      @balance = value
    end
  end
end

acc = BankAccount.new(100)
acc = acc + 50 
puts "Баланс після поповнення: #{acc.balance}"

acc.balance = 300
puts "Баланс після прямої зміни: #{acc.balance}"

acc.balance = -50