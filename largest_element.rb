class Stack
  attr_accessor :items

  # initialize an empty list
  def initialize
    @items = []
  end

  # push a new item to the last index
  def push(item)
    items.push(item)
  end

  # remove the last item
  def pop
    # if the stack is empty, return None
    # (it would also be reasonable to throw an exception)
    if items.none?
      nil
    else
      items.pop
    end
  end

  # see what the last item is
  def peek
    # if the stack is empty, return None
    if items.none?
      nil
    else
      items.last
    end
  end
end

class MaxStack < Stack
  def get_max
    # return the largest element in the stack. get_max() should not remove the item.
    items.sort.last
  end
end

s = MaxStack.new

[1,2,3,4,5,6,7,20,30,8,9,10].each {|i| s.push(i)}

puts s.peek
puts s.pop
puts s.peek
puts s.get_max
