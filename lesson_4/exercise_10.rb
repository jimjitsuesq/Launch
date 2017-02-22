munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

age_group = ''
new_value_hash = {}
new_value_hash_clone = {}
new_hash_final = {}

munsters.each do |key, value|
  value.each do |_key2, value2|
    new_value_hash = value.clone
    new_value_hash_clone = value.clone
    value2.integer?
    age_group = if value2 < 18
                  "kid"
                elsif value2 > 65
                  "senior"
                else
                  "adult"
                end
    new_value_hash.store("age group", age_group)
    break
  end
  new_hash_final.store(key, new_value_hash)
end

p new_hash_final
