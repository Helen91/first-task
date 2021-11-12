alphabet = {}
vowels = ["a", "o", "e", "u", "i"]
index = 0

("a".."z") .each do |abc|
  index += 1
  if vowels.include?(abc)
    alphabet[abc] = index
  end
end
