frequency = 0
frequencies = {0 => 0}
found = false
changes = []

File.open('input.txt', 'r') do |file|
	file.each_line do |line|
		changes << line.to_i
	end
end


while(not found) do
	changes.each do |change|
		frequency += change

		if frequencies[frequency] == nil
			frequencies[frequency] = frequency
		else
			found = true
			puts frequency
			break
		end
	end
end