class HashMap
  attr_accessor :capacity, :size

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @buckets = Array.new(capacity) { [ ] }
    @size = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord}
    hash_code
  end

  def index(key)
    hash(key) % @capacity
  end

  def set(key, value)
    expand_if_needed
    idx = index(key)
    check_bounds(idx)

    bucket = @buckets[idx]
    pair = bucket.find { |entry| entry[0] == key }

    if pair
      pair[1] = value
    else
      bucket << [key, value]
      @size += 1
    end
  end
  

end