def joinor(arr, delim=", ", word="or")
  if arr.count == 2
    puts "1 or 2"
  elsif arr.count == 1
    puts arr.to_s
  else
    arr_last = arr.pop
    arr.push(word)
    puts "#{arr.join(delim)} #{arr_last}"
  end
end


joinor([1, 2])                   # => "1 or 2"

joinor([1, 2, 3])                # => "1, 2, or 3"

joinor([1, 2, 3], '; ')          # => "1; 2; or 3"

joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
