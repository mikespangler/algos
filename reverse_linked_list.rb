# Write a function for reversing a linked list ↴ . Do it in-place ↴ .

# Your function will have one input: the head of the list.

# Your function should return the new head of the list.
require 'pry'

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
c.next = d
d.next = e
e.next = nil

def reverse_list(first_node)
  current_node = first_node
  pointer = nil

  while current_node do
    next_node = current_node.next
    current_node.next = pointer
    pointer = current_node
    current_node = next_node
  end
end

reverse_list(a)

puts e.inspect
puts
puts a.inspect
