fib = [0]
first = 1
while first <= 100
   fib << first
   first += fib[-2]  
end
print fib