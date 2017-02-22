statement = "The Flintstones Rock"

letters = ('a'..'z').to_a

hash = {}

letters.each do |letter|
  frequency = statement.scan(letter).count
  hash[letter] = frequency if frequency > 0
end

p hash
