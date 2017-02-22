ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_values = ages.values

total = 0

ages_values.each do |number|
  if number > 100
    next
  elsif total += number
  end
end

puts total
