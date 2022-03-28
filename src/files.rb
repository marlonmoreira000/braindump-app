require 'json'
# READING
# convert to Ruby array
# data = JSON.load_file('people.json', symbolize_names: true)
# pp data

data = JSON.load_file('schedule.json', symbolize_names: true)
data.each do |item|
    task = Task.new(item[:description], item[:importance], item[:due])
    @task_list.append(task)
end
