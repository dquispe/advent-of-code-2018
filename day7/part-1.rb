steps = {}

#Create directed graph
File.open('input.txt', 'r') do |file|
  file.each_line do |line|
    step = line[5]
    post_step = line[36]

    if steps[step]
      steps[step][:after] << post_step
    else
      steps[step] = { before: [], after: [post_step] }
    end

    if steps[post_step]
      steps[post_step][:before] << step
    else
      steps[post_step] = { before: [step], after: [] }
    end
  end
end

# Use Topological Sorting with smallest available vertex first
# Algorithm from https://en.wikipedia.org/wiki/Topological_sorting#Kahn's_algorithm
result = ''
until steps.empty?
  step = steps.select{|k,v| v[:before].empty? }.keys.sort[0]
  result += step.to_s

  steps[step][:after].each do |post_step|
    steps[post_step][:before].delete step
  end

  steps.delete(step)
end

puts result