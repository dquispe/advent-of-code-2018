points = []
File.open('input.txt', 'r') do |file|
  file.each_line do |line|
    points << {x: line.split(',')[0].to_i, y: line.split(', ')[1].to_i, area: 0, is_infinite: false}
  end
end

x_min = points.min_by{ |value| value[:x] }[:x]
x_max = points.max_by{ |value| value[:x] }[:x]
y_min = points.min_by{ |value| value[:y] }[:y]
y_max = points.max_by{ |value| value[:y] }[:y]

points.each do |point|
  if point[:x] == x_min or point[:x] == x_max or point[:y] == y_min or point[:y] == y_max
    point[:is_infinite] = true
  end
end

(y_min..y_max).each do |y|
  (x_min..x_max).each do |x|
    closest_point = nil
    shortest_distance = 0

    points.each do |point|

      if point[:x] == x and point[:y] == y
        point[:area] += 1
        closest_point = nil
        break
      end

      distance = (point[:x] - x).abs + ( point[:y] - y).abs
      
      if shortest_distance == 0 or distance < shortest_distance
        closest_point = point
        shortest_distance = distance
      elsif distance == shortest_distance
        closest_point = nil
      end
    end

    if not closest_point.nil?
      if (x == x_min or x == x_max or y == y_min or y == y_max)
        closest_point[:is_infinite] = true
      end

      closest_point[:area] += 1 if not closest_point.nil?
    end
  end
end

puts points.select{|point| not point[:is_infinite] }.max_by{ |point| point[:area] }[:area]