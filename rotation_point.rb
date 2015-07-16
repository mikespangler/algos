require 'pry'
require 'benchmark'

WORDS = [
  'p',
  'pa',
  'pb',
  'pc',
  'pd',
  'pe',
  'pf',
  'pg',
  'ptolemaic',
  'retaliation',
  'retrograde',
  'specialization',
  'supplant',
  'taco',
  'tank',
  'tort',
  'turtle',
  'tut',
  'tuvalu',
  'undulate',
  'xenoepist',
  'anhydrous', # <-- rotates here!
  'asymptote', 
  'babka',
  'banoffee',
  'corporate',
  'engender',
  'karpatka',
  'la',
  'lb',
  'lc',
  'ld',
  'le',
  'lf',
  'lg',
  'othellolagkage',
]



def find_rotation_point
  index = WORDS.size / 2
  walk(index)
end

def walk(index)

  current = WORDS[index]
  previous_index = index - 1
  following_index = index + 1

  previous = WORDS[previous_index]
  following = WORDS[following_index]

  if current < previous && current < following
    return current
  elsif current > previous
    walk(previous_index)
  elsif current < following
    walk(following_index)
  end
end

puts "Me: #{Benchmark.measure { find_rotation_point }}"

def find_rotation_pt

  first_word = WORDS[0]

  floor_index = 0
  ceiling_index = WORDS.length - 1

  while floor_index < ceiling_index 

    # guess a point halfway between floor and ceiling
    guess_index = floor_index + ((ceiling_index - floor_index) / 2)

    # if guess comes before first word
    if WORDS[guess_index] > first_word
        # go right
        floor_index = guess_index
    else
        # go left
        ceiling_index = guess_index
    end

    # if floor and ceiling have converged
    if floor_index + 1 == ceiling_index
        # between floor and ceiling is where we flipped to the beginning
        # so ceiling is alphabetically first
        return WORDS[ceiling_index]
    end
  end
end

puts "Parker: #{Benchmark.measure { find_rotation_pt }}"
