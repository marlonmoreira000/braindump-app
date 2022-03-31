require 'json'
require "tty-table"

# this class is used to hold a bunch of daily tasks (Task objects)
class Schedule
    # access permissions
    attr_reader :task_list

    # instance variables
    def initialize(task_list = [])
        @task_list = task_list
    end

    # instance methods
    def add_task(task)
        @task_list.append(task)
    end

    # returns an array of all task descriptions (completed + incompleted tasks)
    def task_descriptions
        task_descriptions = []
        @task_list.each do |task|
            task_descriptions.append(task.description)
        end
        return task_descriptions
    end

    # returns an array of all task descriptions (completed tasks only)
    def task_descriptions_completed
        task_descriptions = []
        @task_list.each do |task|
            task_descriptions.append(task.description) unless task.is_complete
        end
        return task_descriptions
    end

    # remove one or more tasks from schedule
    def delete_tasks(tasks_to_delete_arr)
        @task_list.delete_if { |task_object| tasks_to_delete_arr.include?(task_object.description) }
    end

    # load data from local storage (json) into a ruby Schedule class
    def load_from_json(filepath)
        if File.file?('./schedule.json')
            # populate schedule with tasks from json file
            data = JSON.load_file(filepath, symbolize_names: true)
            data.each do |item|
                # create a Task class for each json entry
                task = Task.new(item[:description], item[:importance], item[:due], item[:is_complete])
                @task_list.append(task)
            end
        else
            # create a json file if there is none
            File.write("schedule.json", 'w') { |file| file.write("[]") }
        end
    end

    # write ruby Schedule class to local storage (json)
    def update_storage(storage_filepath)
        updated_data = []
        # create a json entry for each task object in task list
        @task_list.each do |task|
            task_hash = { description: task.description, importance: task.importance, due: task.due,
                          is_complete: task.is_complete }
            updated_data.append(task_hash)
        end
        # update task data in storage
        File.write(storage_filepath, JSON.pretty_generate(updated_data))
    end

    # helper function for 'show_table' method - generates a list of sorted rows for the schedule table
    def table_rows
        table_rows_list = []
        task_list_sorted = @task_list.sort_by { |task| [task.due_score, task.importance_score] }.reverse
        task_list_sorted.each do |task|
            row = [task.description, task.importance, task.due, task.status_colorized]
            table_rows_list.append(row)
        end
        return table_rows_list
    end

    # print table of daily tasks (sorted)
    def show_table
        headers = ["Task Description".bold, "Importance".bold, "Due".bold, "Status".bold]
        rows = table_rows
        table = TTY::Table.new(header: headers, rows: rows)
        puts ""
        puts table.render(:unicode, resize: true, padding: [0, 1])
        puts ""
    end

    # clear all tasks from schedule
    def delete_all_tasks
        @task_list = []
    end

    # mark task/s as complete
    def mark_tasks_as_complete(tasks_arr)
        @task_list.each do |task_obj|
            task_obj.mark_as_complete if tasks_arr.include?(task_obj.description)
        end
    end

    # check if all tasks in schedule are complete (returns bool)
    def all_tasks_complete?
        @task_list.each do |task|
            return false if task.is_complete == false
        end
        return true
    end

    # # this method is only used for degugging purposes
    # def show_tasklist
    #     pp @task_list
    # end
end
