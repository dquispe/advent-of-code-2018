File.open('input.txt', 'r') do |file|
	overlap_count = 0
	grid = []

	file.each_line do |line|
		id = line[1..line.index('@')-2]
		left_margin = line[line.index('@')+2..line.index(',')-1].to_i
		top_margin = line[line.index(',')+1..line.index(':')-1].to_i
		length = line[line.index(':')+2..line.index('x')-1].to_i
		width = line[line.index('x')+1..-1].to_i

		i = top_margin
		while i < top_margin + width
			j = left_margin
			while j < left_margin + length
				if grid[i] != nil
					if grid[i][j] != nil
						unless grid[i][j] == 'x'
							grid[i][j] = 'x'
							overlap_count += 1
						end
					else
						grid[i][j] = id
					end
				else
					grid[i] = []
					grid[i][j] = id
				end
				j += 1
			end
			i += 1
		end
	end

	puts overlap_count
end