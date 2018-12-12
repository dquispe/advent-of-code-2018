File.open('input.txt', 'r') do |file|
  file.each_line do |line|
    tokens = line.split ''
    pair_found = true

    while pair_found
      pair_found = false

      (0..tokens.length-2).each do |i|
        if tokens[i] != nil and (tokens[i].ord - tokens[i+1].ord).abs == 32
          tokens[i] = nil
          tokens[i+1] = nil
          pair_found = true
        end
      end

      tokens = tokens.join.split ''
    end

    puts tokens.count
  end
end