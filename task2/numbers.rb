daysInmonth = [31,28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts "напиши день "
day = gets.to_i
puts "напиши месяц"
month = gets.to_i
puts "напиши год"
years = gets.to_i

result = 0

(month - 1).times do |i|
  result += daysInmonth[i]
end

result += day

if (years % 4 == 0 && years % 100 != 0) || years % 400 == 0
  result += 1
end
