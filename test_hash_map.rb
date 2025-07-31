require_relative 'hash_map'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "Length before overwrite: #{test.length}"
test.set('apple', 'crimson')
test.set('banana', 'bright yellow')
puts "Length after overwrite (should be same): #{test.length}"

# Trigger resize
test.set('moon', 'silver')

puts "\n--- After Resizing ---"
puts "Length: #{test.length}"
puts "Capacity: #{test.capacity}"
puts "Has lion?: #{test.has?('lion')}"
puts "Value for apple: #{test.get('apple')}"
puts "Remove frog: #{test.remove('frog')}"
puts "Length after remove: #{test.length}"
puts "All keys: #{test.keys}"
puts "All values: #{test.values}"
puts "All entries: #{test.entries}"

puts "\nClearing..."
test.clear
puts "Length after clear: #{test.length}"
