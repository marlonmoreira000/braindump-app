# TODOS
# delete tasks method: what msg to output if deleting no tasks?

# IMPORTS
require "tty-prompt"
require "tty-font"
require "colorize"
require "./functions"
require "./task"
require "./schedule"

# CONSTANTS
font = TTY::Font.new(:doom)
prompt = TTY::Prompt.new
storage_filepath = './schedule.json'

# MAIN PROGRAM
program_running = true
puts ""
puts font.write("dayplanner")
puts ""
schedule = Schedule.new
schedule.load_from_json(storage_filepath)

while program_running
    puts ""
    menu_selection = prompt.select("Menu selection".bold, ["Add task", "Delete task", "See schedule",
                                                      "Clear schedule", "Quit"])

    case menu_selection

    when "Add task"
        anymore_tasks = true
        while anymore_tasks
            # get task information from user
            description = prompt.ask("Enter task description.\n>>", required: true, max: 10)
            importance = prompt.select("How important is this task?", ["Low", "Medium", "High", "Very high"])
            due = prompt.select("When is this task due?", %w[Morning Midday Afternoon Evening])
            # create task object
            task = Task.new(description, importance, due)
            # add task to schedule
            schedule.add_task(task)
            # print confirmation msg
            Functions.print_add_confirmation(task)
            # ask user for anymore tasks
            anymore_tasks = prompt.yes?("Do you have another tasks to do today?")
        end

    when "Delete task"
        if schedule.task_list.empty?
            puts "#{'>>'.red} You currently have no tasks."
        else
            tasks_to_delete = prompt.multi_select("Select task/s to delete.", schedule.task_descriptions)
            if tasks_to_delete.empty?
                puts "#{'>>'.red} No tasks were deleted."
            else
                confirm_delete = prompt.yes?("Are you sure you want to delete this task/s?")
                if confirm_delete
                    schedule.delete_tasks(tasks_to_delete)
                    puts "You deleted #{tasks_to_delete.length} task/s."
                end
            end
        end

    when "See schedule"
        if schedule.task_list.empty?
            puts "#{'>>'.red} You currently have no tasks."
        else
            schedule.show_table
        end

    when "Clear schedule"
        if schedule.task_list.empty?
            puts "#{'>>'.red} You currently have no tasks."
        else
            confirm_delete = prompt.yes?("Are you sure you want to delete all tasks?")
            if confirm_delete
                schedule.delete_all_tasks
                puts "You deleted all tasks."
            end
        end

    when "Quit"
        puts "Goodbye!"
        program_running = false
        # update persistent storage with new task
        schedule.update_storage(storage_filepath)

    else
        puts "i'm not sure how you arrived here but i'm scared."
    end
end
