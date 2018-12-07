File.open('input.txt', 'r') do |file|
	exactly_two = 0
	exactly_three = 0

	file.each_line do |line|
		char_counts = {}
		line.split('').each do |char|
			if char_counts[char] == nil
				char_counts[char] = 1
			else
				char_counts[char] += 1
			end
		end

		found_exactly_two = false
		found_exactly_three = false

		char_counts.each do |k,v|
			if v == 2 and not found_exactly_two
				exactly_two += 1
				found_exactly_two = true
			end

			if v == 3 and not found_exactly_three
				exactly_three += 1
				found_exactly_three = true
			end
		end
	end

	puts exactly_two * exactly_three
end