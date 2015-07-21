class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
  end
end

a = Node.new("Angel Food")
b = Node.new("Bundt")
c = Node.new("Cheese")
d = Node.new("Devil's Food")
e = Node.new("Eccles")

a.next = b
b.next = c
c.next = d
d.next = e


# takes an integer k and the head_node of a singly linked list, and returns the kth to last node in the list.

def kth_to_last_node(int, first_node)
  current_node = first_node
  length = 0

  while current_node
    length +=1
    current_node = current_node.next
  end
  
  current_node = first_node
  
  until length == int
    current_node = current_node.next
    length -= 1
  end

  puts current_node.inspect

end


kth_to_last_node(2, a)

# returns the node with value "Devil's Food" (the 2nd to last node)
