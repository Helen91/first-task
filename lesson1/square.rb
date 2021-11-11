puts "Напиши первый коэффициент"
a = gets.chomp.to_f
puts "Напиши второй коэффицент"
b = gets.chomp.to_f
puts "Напиши третий коэффицент"
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d > 0
  x1 =(-b + Math.sqrt(d))/(2*a)
  x2 = (-b - Math.sqrt(d))/(2*a) 
  puts "Дискриминант = #{d}, первый корень = #{x1}, второй корень #{x2} "
elsif d < 0
  puts "Дискриминант = #{d}, корней нет"
else d = 0 
  x = -b/(2*a)
  puts "Один корень = #{x}"
end
