require 'json'

# this class is used to hold a bunch of daily tasks (Task objects)
class Schedule
    attr_reader :task_list

    def initialize(task_list = [])
        @task_list = task_list
    end

    def add_task(task)
        @task_list.append(task)
    end

    def task_descriptions
        task_descriptions = []
        @task_list.each do |task|
            task_descriptions.append(task.description)
        end
        return task_descriptions
    end

    def delete(tasks_to_delete_arr)
        @task_list.each do |task_object|
            @task_list.delete(task_object) if tasks_to_delete_arr.include?(task_object.description)
        end
        return task_descriptions
    end

    def load_from_json(filepath)
        data = JSON.load_file(filepath, symbolize_names: true)
        data.each do |item|
            task = Task.new(item[:description], item[:importance], item[:due])
            @task_list.append(task)
        end
        return data
    end
end
