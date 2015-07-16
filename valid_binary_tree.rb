require 'pry'
module Tree
  class Node
    attr_accessor :left, :right, :value

    def initialize(value)
      @value = value
    end

    def valid?
      if left
        if value > left.value
          left.valid?
        else
          return puts "node invalid"
        end
      end

      if right
        if value < right.value
          right.valid?
        else
          return puts "node invalid"
        end
      end
      puts "node valid"
    end

    def insert(val)
      case value <=> val
        when 1 then insert_left(val)
        when -1 then insert_right(val)
        when 0 then false # the value is already present
      end
    end

    def include?(val)
      case value <=> val
        when 1 then check_left(val)
        when -1 then check_right(val)
        when 0 then true # the current node is equal to the value
      end
    end

    private

    def valid_left(val)
      if val > left.value
        valid?(left)
      else
        false
      end
    end

    def valid_right(val)
      if val > left.value
        valid?(left)
      else
        false
      end
    end

    def check_left(val)
      left ? left.include?(val) : false
    end

    def check_right(val)
      right ? right.include?(val) : false
    end

    def insert_left(val)
      if left
        left.insert(val)
      else
        self.left = Node.new(val)
      end
    end

    def insert_right(val)
      if right
        right.insert(val)
      else
        self.right = Node.new(val)
      end
    end

  end
end

node = Tree::Node.new(1)
100.times { node.insert(rand(100)) }
node.valid?

