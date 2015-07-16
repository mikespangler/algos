require 'pry'

WORDS = [
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

puts find_rotation_point
