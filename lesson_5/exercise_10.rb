arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_hash = {}

new_arr = []

arr.map do |hsh|
  hsh.each do |key, value|
      new_hash[key] = value + 1
    end
  new_arr << new_hash
end

p new_arr
p new_hash
