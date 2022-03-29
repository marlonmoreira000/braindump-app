require 'json'
require "tty-table"

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

    def task_descriptions_completed
        task_descriptions = []
        @task_list.each do |task|
            task_descriptions.append(task.description) unless task.is_complete
        end
        return task_descriptions
    end

    def delete_tasks(tasks_to_delete_arr)
        @task_list.delete_if { |task_object| tasks_to_delete_arr.include?(task_object.description) }
    end

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

    def table_rows
        table_rows_list = []
        task_list_sorted = @task_list.sort_by { |task| [task.due_score, task.importance_score] }.reverse
        task_list_sorted.each do |task|
            row = [task.description, task.importance, task.due, task.status_colorized]
            table_rows_list.append(row)
        end
        return table_rows_list
    end

    def show_table
        headers = ["Task Description".bold, "Importance".bold, "Due".bold, "Status".bold]
        rows = table_rows
        table = TTY::Table.new(header: headers, rows: rows)
        puts ""
        puts table.render(:unicode, resize: true, padding: [0, 1])
        puts ""
    end

    def delete_all_tasks
        @task_list = []
    end

    def show_tasklist
        pp @task_list
    end

    def mark_tasks_as_complete(tasks_arr)
        @task_list.each do |task_obj|
            if tasks_arr.include?(task_obj.description)
                task_obj.mark_as_complete
            end
        end
    end
end
