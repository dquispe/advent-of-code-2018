time = 0
steps = {}
workers = {
  1 => {step: nil, time_left: nil},
  2 => {step: nil, time_left: nil},
  3 => {step: nil, time_left: nil},
  4 => {step: nil, time_left: nil},
  5 => {step: nil, time_left: nil}
}
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
  available_steps = steps.select{|k,v| v[:before].empty? }.keys.sort

  available_steps.each do |step|

    worker = workers.find{ |k,v| v[:step] == step }
    if worker
      worker = worker.last
      worker[:time_left] -= 1
    else
      worker = workers.find{ |k,v| v[:step].nil? }
      if worker
        worker = worker.last
        worker[:step] = step
        worker[:time_left] = (step.ord - 65) + 60
      end
    end

    if worker and worker[:time_left] == 0
      worker[:step] = nil
      worker[:time_left] = nil

      steps[step][:after].each do |post_step|
        steps[post_step][:before].delete step
      end

      steps.delete step
    end    
  end

  time += 1
end

puts time