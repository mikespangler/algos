require 'benchmark'

@values = [0,1]

def memo_fib(n)
  case n
  when 0
    @values[0]
  when 1
   @values[1]
  else
    @values[n] ||= memo_fib(n-1) + memo_fib(n-2)
  end
end

print Benchmark.measure { memo_fib(5000) }

def bottom_up_fib(n)

  prev = 0
  prev_prev = 1
  current = 0

  (0...n).each do 
    current = prev + prev_prev
    prev_prev = prev
    prev = current
  end

  current
  
end

print Benchmark.measure { bottom_up_fib(5000) }

