hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = []

hsh.each do |_key, values|
  letters = values.join
  vowels << letters.scan(/[aeiou]/)
end

p vowels.join
