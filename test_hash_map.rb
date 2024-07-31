require_relative 'hash_map' # Make sure this points to your HashMap file

# Create a new instance of HashMap
test = HashMap.new

puts 'Populating the HashMap...'
# Populate the HashMap
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

puts "\nTesting get method:"
puts "Value for 'apple': #{test.get('apple')}"
puts "Value for 'banana': #{test.get('banana')}"

puts "\nTesting has? method:"
puts "Has 'dog'?: #{test.has?('dog')}"
puts "Has 'cat'?: #{test.has?('cat')}"

puts "\nTesting length method:"
puts "Current length: #{test.length}"

puts "\nOverwriting some values..."
test.set('apple', 'green')
test.set('banana', 'ripe yellow')

puts "\nTesting get after overwrite:"
puts "New value for 'apple': #{test.get('apple')}"
puts "New value for 'banana': #{test.get('banana')}"

puts "\nAdding a new key-value pair to trigger growth..."
test.set('moon', 'silver')

puts "\nNew length after growth: #{test.length}"

puts "\nTesting remove method:"
removed_value = test.remove('dog')
puts "Removed value for 'dog': #{removed_value}"
puts "Has 'dog' after removal?: #{test.has?('dog')}"

puts "\nTesting keys method:"
puts "All keys: #{test.keys.inspect}"

puts "\nTesting values method:"
puts "All values: #{test.values.inspect}"

puts "\nTesting entries method:"
puts "All entries: #{test.entries.inspect}"

puts "\nTesting clear method:"
test.clear
puts "Length after clear: #{test.length}"
