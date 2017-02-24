# This solution works in ird, but not as a program(?)

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hash = {}
  hsh.each do |key, value|
    
      new_hash[key] = value + 1
    
    end
  new_hash
end


