# this class is used to hold a bunch of daily tasks (Task objects)
class Schedule
    attr_reader :task_list

    def initialize(task_list = [])
        @task_list = task_list
    end

    def add_task(task)
        @task_list.append(task)
    end
end
