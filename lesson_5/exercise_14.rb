hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

array = []

hsh.map do |key1, value1|
  if value1.has_value?("fruit") then
    value1[:colors].map do |color_val|
    array << color_val.capitalize
    end
  else
    array << value1[:size].upcase
  end
end

p array
