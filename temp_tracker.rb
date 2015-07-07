#optimize for reads

class TempTracker
  attr_accessor :max, :min, :mean, :mode, :total_readings, :total_temp, :most_occurrences

  def initialize
    @temps = Hash.new(0)
    @mean = 0.0
    @total_temp, @total_readings, @min, @max, @most_occurrences = 0,0,110,0,0
  end

  def insert(temp)
    #mean
    @total_temp += temp
    @total_readings += 1
    @mean = @total_temp / @total_readings

    #mode
    @temps[temp] += 1

    if @temps[temp] > @most_occurrences
      @mode = temp
    end

    #min
    @min = [temp,@min].min

    #max
    @max = [temp,@max].max
  end

  def get_max
    @max
  end

  def get_min
    @min
  end

  def get_mean
    @mean
  end

  def get_mode
    @mode
  end
end

tracker = TempTracker.new

100000.times { tracker.insert(rand(0..110)) }

puts "Min: #{tracker.get_min}"
puts "Max: #{tracker.get_max}"
puts "Mean: #{tracker.get_mean}"
puts "Mode: #{tracker.get_mode}"
