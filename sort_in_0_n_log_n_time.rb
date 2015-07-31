require 'pry'

def greatest_score(score_array)

  temp = []
  
  score_array.each do |score|
    if temp[score]
      temp[score] = temp[score] + 1
    else
      temp[score] = 1
    end
  end
  
  temp.each_with_index do |x, i|
    if x
      x.times do
        puts i
      end
    end
  end
end

scores = [3,56,3,7,34,54,75,68,34,58,34,73,3,63,63,12,32,23,23,23,21,42,23,913,84,36]

greatest_score(scores)
