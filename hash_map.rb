class HashMap
  def initialize(initial_capacity = 16, load_factor = 0.75)
    @buckets = Array.new(initial_capacity)
    @load_factor = load_factor
    @size = 0
  end

  def set(key, value)
    hash_code = hash(key)
    index = index_for(hash_code)
    check_index(index)

    if @buckets[index].nil?
      @buckets[index] = [[key, value]]
    else
      bucket = @buckets[index]
      existing_pair = bucket.find { |k, _| k == key }
      if existing_pair
        existing_pair[1] = value
      else
        bucket << [key, value]
      end
    end

    @size += 1
    grow_if_needed
  end

  def get(key)
    hash_code = hash(key)
    index = index_for(hash_code)
    check_index(index)

    bucket = @buckets[index]
    return nil if bucket.nil?

    pair = bucket.find { |k, _| k == key }
    pair ? pair[1] : nil
  end

  def has?(key)
    !get(key).nil?
  end

  def remove(key)
    hash_code = hash(key)
    index = index_for(hash_code)
    check_index(index)

    bucket = @buckets[index]
    return nil if bucket.nil?

    pair_index = bucket.index { |k, _| k == key }
    return unless pair_index

    removed_pair = bucket.delete_at(pair_index)
    @size -= 1
    removed_pair[1]
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@buckets.length)
    @size = 0
  end

  def keys
    @buckets.compact.flatten(1).map(&:first)
  end

  def values
    @buckets.compact.flatten(1).map(&:last)
  end

  def entries
    @buckets.compact.flatten(1)
  end

  private

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def index_for(hash_code)
    hash_code % @buckets.length
  end

  def check_index(index)
    raise IndexError if index.negative? || index >= @buckets.length
  end

  def grow_if_needed
    return unless @size.to_f / @buckets.length >= @load_factor

    new_capacity = @buckets.length * 2
    old_buckets = @buckets
    @buckets = Array.new(new_capacity)
    @size = 0

    old_buckets.each do |bucket|
      next if bucket.nil?

      bucket.each { |key, value| set(key, value) }
    end
  end
end
