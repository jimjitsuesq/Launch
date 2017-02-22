flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_index = []

flintstones.each_with_index do |value, index|
  flintstones_index << index
end

flintstones_hash = Hash[flintstones.zip(flintstones_index)]
puts flintstones_hash
