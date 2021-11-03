puts "Напиши первый коэффициент"
a = gets.chomp.to_f
puts "Напиши второй коэффицент"
b = gets.chomp.to_f
puts "Напиши третий коэффицент"
c = gets.chomp.to_f

D = b**2 - 4 * a * c
if D > 0
 X1 =(-b + Math.sqrt(D))/(2*a)
 X2 = (-b - Math.sqrt(D))/(2*a) 
puts "Дискриминант = #{D}, первый корень = #{X1}, второй корень #{X2} "
elsif D < 0
puts "Дискриминант = #{D}, корней нет"
else D = 0 
 X = -b/(2*a)
 puts "Один корень = #{X}"
end
