File.open('input.txt', 'r') do |file|
	sum = 0
	file.each_line do |line|
		sum += line.to_i
	end
	puts sum
end