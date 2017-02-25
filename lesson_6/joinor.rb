array = []

def joinor(obj)
  array = []
  obj.each do |obj|
    array << obj
  end
end



joinor([1, 2])                   # => "1 or 2"
p array
joinor([1, 2, 3])                # => "1, 2, or 3"

joinor([1, 2, 3], '; ')          # => "1; 2; or 3"

joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
