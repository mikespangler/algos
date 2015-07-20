require 'pry'

class Queue
  attr_accessor :stack1, :stack2

  def initialize
    @stack1 = []
    @stack2 = []
  end

  def enqueue(value)
    stack1.unshift(value)
  end

  def dequeue
    if stack2.length < 1
      stack1.length.times { stack2.unshift(stack1.shift) }
    end
    stack2.shift
  end
end


q = Queue.new

['a','b','c'].each { |x| q.enqueue(x) }

puts q.dequeue

['d','e','f'].each { |x| q.enqueue(x) }

puts q.dequeue
puts q.dequeue

['g','h','i'].each { |x| q.enqueue(x) }

puts q.dequeue
puts q.dequeue

