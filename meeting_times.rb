meeting_times = [[1, 10], [2, 6], [3, 5], [7, 9]]
meeting_times = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

meeting_times = meeting_times.sort_by! {|t| t[0]}

def condense_meeting_times(meeting_times)
  last_start_time = meeting_times.first[0]
  last_end_time   = meeting_times.first[1]
  last_meeting    = meeting_times.last
  arr = []

  meeting_times.each.with_index do |meeting, i|
    next if i == 0

    start_time = meeting[0]
    end_time   = meeting[1]

    if start_time <= last_end_time
      last_end_time = [end_time, last_end_time].max
    else
      arr << [last_start_time, last_end_time]
      last_end_time = end_time
      last_start_time = start_time
    end

    if meeting == last_meeting
      arr << [last_start_time, last_end_time]
    end
  end
  print arr
end

condense_meeting_times(meeting_times)
