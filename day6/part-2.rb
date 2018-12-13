points = []
File.open('input.txt', 'r') do |file|
  file.each_line do |line|
    points << {x: line.split(',')[0].to_i, y: line.split(', ')[1].to_i }
  end
end

x_min = points.min_by{ |value| value[:x] }[:x]
x_max = points.max_by{ |value| value[:x] }[:x]
y_min = points.min_by{ |value| value[:y] }[:y]
y_max = points.max_by{ |value| value[:y] }[:y]

region_area = 0

(y_min..y_max).each do |y|
  (x_min..x_max).each do |x|
    sum = 0

    points.each do |point|
      distance = (point[:x] - x).abs + ( point[:y] - y).abs
      sum += distance
    end

    if sum < 10000
      region_area += 1
    end
  end
end

puts region_area