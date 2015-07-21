class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
  end

  def delete_node
    if self.next
      self.value = self.next.value
      self.next = self.next.next
    else
      raise 'This Was The Last Node!'
    end
  end
end

a = Node.new('A')
b = Node.new('B')
c = Node.new('C')

a.next = b
b.next = c

b.delete_node
