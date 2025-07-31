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

  def get(key)
    idx = index(key)
    check_bounds(idx)

    bucket = @buckets[idx]
    pair = bucket.find { |entry| entry[0] == key }
    pair ? pair[1] : nil
  end

  def has?(key)
    idx = index(key)
    check_bounds(idx)

    bucket = @buckets[idx]
    bucket.any? { |entry| entry[0] == key}
  end

  def remove(key)
    idx = index(key)
    check_bounds(idx)

    bucket = @buckets[idx]
    pair = bucket.find { |entry| entry[0] == key}

    if pair
      bucket.delete(pair)
      @size -= 1
      pair[1]
    else
      nil
    end
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end

  def keys
    @buckets.flatten(1).map(&:first)
  end

  def values
    @buckets.flatten(1).map(&:last)
  end

  def entries
    @buckets.flatten(1)
  end

  private

  def check_bounds(index)
    raise IndexError if index.negative? || index >= @buckets.length
  end

  def expand_if_needed
    if @size.to_f / @capacity >= @load_factor
      old_buckets = @buckets
      @capacity *= 2
      @buckets = Array.new(@capacity) { [] }
      @size = 0

      old_buckets.each do |bucket|
        bucket.each { |key, value| set(key, value )}
      end
    end
  end
end