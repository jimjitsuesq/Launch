words = "the flintstones rock"

words_array = words.split

new_arr = []

words_array.each do |word|
  new_arr << word.capitalize!
end

new_words = new_arr.join(" ")

p new_words
