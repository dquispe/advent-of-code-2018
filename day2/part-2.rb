File.open('input.txt', 'r') do |file|
	lines = file.each_line.to_a
	lines.each_with_index do |line, index|
		rest_of_lines = lines[index..-1]
		rest_of_lines.each do |other_line|
			difference_index = -1
			index_not_found = false
			line_arr = line.split ''
			other_line_arr = other_line.split ''

			i = 0
			while i <  line_arr.length
				if line_arr[i] != other_line_arr[i]
					if difference_index < 0
						difference_index = i
					else
						index_not_found = true
						break
					end
				end
				i += 1
			end

			if index_not_found
				next
			else
				if difference_index > -1
					puts line[0..difference_index-1] + line[difference_index+1..-1]
				end
			end
		end
	end
end