require 'pry'
require 'benchmark'

class Node
  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
    @left  = EmptyNode.new
    @right = EmptyNode.new
  end

  def insert(val)
    case value <=> val
      when 1 then insert_left(val)
      when -1 then insert_right(val)
      when 0 then false # the value is already present
    end
  end

  def insert_left(val)
    if !left.is_a?(EmptyNode)
      left.insert(val)
    else
      self.left = Node.new(val)
    end
  end

  def insert_right(val)
    if !right.is_a?(EmptyNode)
      right.insert(val)
    else
      self.right = Node.new(val)
    end
  end

  def include?(val)
    case value <=> val
      when 1 then check_left(val)
      when -1 then check_right(val)
      when 0 then true 
    end
  end

  def check_left(val)
    if left
      left.include?(val)
    else
      false
    end
  end  

  def check_right(val)
    if right
      right.include?(val)
    else
      false
    end
  end
end

class EmptyNode
  attr_accessor :value

  def initialize
    @value = nil
  end

  def include?(*)
    false
  end
end


arr = []
a = Node.new(1)


100000.times do
  n = rand(100000)
  arr << n
  a.insert(n)
end

b_tree = arr.map { |n| a.insert(n) }

# puts a.include?(7) #t
# puts a.include?(55) #f
# puts a.include?(67) #t
# puts a.include?(90) #f
# puts a.include?(242) #t

puts "Ruby Array: #{Benchmark.measure { arr.include?(2340) }}"

puts "B Tree#{Benchmark.measure { a.include?(2340) }}"


