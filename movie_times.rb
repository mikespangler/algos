
movie_lengths = [85,90,95,100,105,110,115,120,125,130,135,135]
flight_length = 270

def movie_times(flight_length, movie_lengths)
  hash = {}
  movie_lengths.each do |first_movie_length|
    second_movie_length = flight_length - first_movie_length
    return true if hash[second_movie_length] == true && second_movie_length != first_movie_length
    hash[first_movie_length] = true
  end
  false
end

puts movie_times(flight_length, movie_lengths)
