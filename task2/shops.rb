cart = {}

loop do
  puts "Введите название товара. Если закончилли напишите 'stop' "
  product = gets.chomp
  break if product == "stop"

  puts "Напишите стоймость товара"
  cost = gets.to_i

  puts "Напишите количества товара "
  quantity = gets.to_i

  cart[product] = {
    "стоймость товара" => cost ,
    "количесво товара" => quantity,
    "итоговая стоимость" => cost * quantity,
  }
end

puts cart

total_cost = 0

cart.each do |k, v|
  total_cost += v["итоговая стоимость"]
end

puts total_cost