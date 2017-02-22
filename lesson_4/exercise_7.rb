statement = "The Flintstones Rock"

statement_array = statement.downcase.chars.sort

arr = []

statement_array.each do |letter|
   if arr.empty?
    arr << letter
    next
   else  


p statement_array
