flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |firsttwo, index|
  if firsttwo.start_with?("Be")
    puts index
    break
  else next
  end
end