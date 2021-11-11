puts "What's your name?"
name = gets.chomp
puts "Your height?"
height = gets.chomp.to_i
form = (height - 110) * 1.15
if form > 0
  puts  "#{name}, your weight is #{form}!"
elsif form < -1
  puts "Your weight is already optimal!"
end
