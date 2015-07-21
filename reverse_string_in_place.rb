require 'benchmark'

string = 'supercalifragilisticexpialidocious'

class String
  def mike_reverse!
    self.each_char.with_index do |char, index|
      index += 1
      self.insert(-index, self.slice!(char))
    end
    self
  end

  def parker_reverse!
    left_pointer  = 0
    right_pointer = self.length - 1

    while left_pointer < right_pointer
      # swap characters
      temp = self[left_pointer]
      self[left_pointer]  = self[right_pointer]
      self[right_pointer] = temp

      # move towards middle
      left_pointer  += 1
      right_pointer -= 1
    end

    self
  end
end

print string.mike_reverse!
puts Benchmark.measure { string.mike_reverse! }
print string.parker_reverse!
puts Benchmark.measure { string.parker_reverse! }



