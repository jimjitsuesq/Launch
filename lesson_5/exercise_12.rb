arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}

arr.each do |subarr|
  subarr.each do |dex0, dex1|
    dex0 = subarr[0]
    dex1 = subarr[1]
    hsh.store(dex0, dex1)
  end
end

p hsh
