require 'benchmark'

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
  end
end

a = Node.new('A')
b = Node.new('B')
c = Node.new('C')
d = Node.new('D')
e = Node.new('E')

a.next = b
b.next = c
c.next = b
d.next = e
e.next = nil

# O(n)time & O(n) space

def contains_cycle?(node)
  visited = []
  while node.next
    return true if visited.include?(node)
    visited << node
    node = node.next
  end
  false
end

puts Benchmark.measure { contains_cycle?(a) }

# O(n) time & O(1) space

def check_cycle(first_node)

  # start both runners at the beginning
  slow_runner = first_node
  fast_runner = first_node

  # until we hit the end of the list
  while fast_runner && fast_runner.next
    slow_runner = slow_runner.next
    fast_runner = fast_runner.next.next

    # case: fast_runner is about to "lap" slow_runner
    return true if fast_runner == slow_runner
  end
  # case: fast_runner hit the end of the list
  false
end

puts Benchmark.measure { check_cycle(a) }
