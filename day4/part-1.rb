require 'Date'

File.open('input.txt', 'r') do |file|
    lines = file.each_line
    lines = lines.sort do |x, y|
        match = x.match /\[.*\]/
        date_1 = DateTime.parse match[0].gsub(/(\[|\])/, '')
        match = y.match /\[.*\]/
        date_2 = DateTime.parse match[0].gsub(/(\[|\])/, '')
        date_1 <=> date_2
    end

    records = {}
    current_guard = nil
    time_asleep = nil

    lines.each do |line|
        match = line.match /\[.*\]/
        date = DateTime.parse match[0].gsub(/(\[|\])/, '')
        match = line.match /Guard #\d+/
        if match
            current_guard = match[0].gsub 'Guard #', ''
        end

        if line.include? 'falls asleep'
            time_asleep = date.minute
        end

        if line.include? 'wakes up'

            (time_asleep..date.minute-1).each do |minute|

                if records[current_guard]
                    if records[current_guard][minute]
                        records[current_guard][minute] += 1
                    else
                        records[current_guard][minute] = 1
                    end
                else
                    records[current_guard] = {minute => 1}
                end
            end
        end
    end

    longest_asleep = records.max_by do |k,v|
        v.values.reduce :+
    end

    puts longest_asleep[0].to_i * longest_asleep[1].max_by{ |k,v| v }[0].to_i
end