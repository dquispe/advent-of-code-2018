line = File.open('input.txt', 'r'){ |file| file.readline }
min = nil

('a'..'z').each do |char|
  tokens = line.gsub(/[#{char}#{char.upcase}]/, '').split ''
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

  if min.nil?
    min = tokens.count
  else
    if tokens.count < min
      min = tokens.count
    end
  end
end

puts min