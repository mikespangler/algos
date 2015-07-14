require 'pry'

module Tree
  class Node
    attr_accessor :left, :right, :value, :parent

    def initialize(value, parent = nil)
      @value = value
      @parent = parent
    end

    def insert(val)
      case value <=> val
        when 1 then insert_left(val)
        when -1 then insert_right(val)
        when 0 then false # the value is already present
      end
    end

    def largest
      if right
        right.largest
      else
        self
      end
    end

    def second_largest
      if self.largest.left
        self.largest.left.largest
      else
        self.largest.parent
      end
    end

    private

    def insert_left(val)
      if left
        left.insert(val)
      else
        self.left = Node.new(val, self)
      end
    end

    def insert_right(val)
      if right
        right.insert(val)
      else
        self.right = Node.new(val, self)
      end
    end

  end
end

node = Tree::Node.new(1)
arr = []
20.times do
  n = rand(50)
  node.insert(n)
  arr << n
end
print arr.sort
puts
print node.largest.value
puts
print node.second_largest.value
puts
