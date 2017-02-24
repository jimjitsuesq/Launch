arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.each do |arr2|
  arr2.reject! do |num|
    num % 3 != 0
  end
end

p arr
        