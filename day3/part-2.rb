File.open('input.txt', 'r') do |file|
	grid = []
	possible_clear_ids = []

	file.each_line do |line|
		id = line[1..line.index('@')-2]
		left_margin = line[line.index('@')+2..line.index(',')-1].to_i
		top_margin = line[line.index(',')+1..line.index(':')-1].to_i
		length = line[line.index(':')+2..line.index('x')-1].to_i
		width = line[line.index('x')+1..-1].to_i

		has_overlap = false
		i = top_margin
		while i < top_margin + width
			j = left_margin
			while j < left_margin + length
				if grid[i] != nil
					if grid[i][j] != nil
						has_overlap = true
						if possible_clear_ids.include? grid[i][j]
							possible_clear_ids.delete grid[i][j]
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

		if not has_overlap
			possible_clear_ids << id
		end
	end

	# There should only be 1 id in the array
	puts possible_clear_ids[0]
end