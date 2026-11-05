simple_proc = Proc.new { puts "Виклик Proc без параметрів" }
simple_proc.call

flex_proc = Proc.new { |x, y| puts "x: #{x.inspect}, y: #{y.inspect}" }
flex_proc.call(10)
flex_proc.call(10, 20, 30)

def proc_return_test
  my_proc = Proc.new { return "Значення повернуто зсередини Proc" }
  my_proc.call
  "Цей рядок ніколи не виконається"
end

puts proc_return_test