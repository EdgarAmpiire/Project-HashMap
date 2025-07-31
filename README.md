# 🗂️ Ruby HashMap

This project is a custom implementation of a `HashMap` in Ruby, built as part of [The Odin Project](https://www.theodinproject.com/) curriculum. It mimics how hash maps work under the hood, including hash code generation, collision handling, dynamic resizing, and core map functionalities.

---

## 🚀 Features

- String key hashing using a prime-based hash function
- Collision handling with **separate chaining**
- Auto-resizing when load factor exceeds `0.75`
- Supports the following methods:
  - `set(key, value)`
  - `get(key)`
  - `has?(key)`
  - `remove(key)`
  - `length`
  - `clear`
  - `keys`
  - `values`
  - `entries`

---

## 🧪 Test Instructions

Create a test file and use the sample below to verify the functionality:

```ruby
require_relative 'hash_map'

test = HashMap.new

# Add initial entries
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

# Overwrite existing values
test.set('apple', 'crimson')
test.set('banana', 'bright yellow')

# Trigger resize
test.set('moon', 'silver')

# Validate
puts test.length
puts test.get('lion')
puts test.has?('apple')
puts test.remove('frog')
puts test.keys.inspect
puts test.values.inspect
puts test.entries.inspect
test.clear
puts test.length
```

## 📦 How It Works
- Hashing: A custom hash function converts string keys to a numeric hash code.

- Indexing: Hash codes are mapped to a bucket using modulo (%) operator.

- Storage: Each bucket is an array holding key-value pairs ([key, value]).

- Collisions: Multiple keys hashed to the same bucket are stored in the same array.

- Resize: When load factor exceeds 0.75, the capacity is doubled and all entries are rehashed.

## 🛠️ Project Structure
```graphql
.
├── hash_map.rb        # Contains the HashMap class
├── test_hash_map.rb   # Sample test file
└── README.md          # Project documentation
```

