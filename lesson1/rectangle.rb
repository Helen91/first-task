puts "Первая сторана"
a = gets.chomp.to_i
puts "Вторая сторона"
b = gets.chomp.to_i
puts "Третья сторона"
c = gets.chomp.to_i

a,b,c = [a, b, c].sort

if a == b && a == c
  puts  "Равносторонний треугольник "
elsif a == b || a == c || b == c
  puts "Равнобедренный треугольник"
elsif c**2 == a**2 + b**2
  puts "Прямоугольный треугольник"
end
