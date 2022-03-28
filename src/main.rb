# TODOS
# delete tasks method: what msg to output if deleting no tasks?

# IMPORTS
require "tty-prompt"
require "tty-font"
require "./functions"
require "./task"
require "./schedule"

# CONSTANTS
# importances = { "Low" => 1, "Medium" => 2, "High" => 3, "Very high" => 4 }
# dues = { "Evening" => 1, "Afternoon" => 2, "Lunchtime" => 3, "Morning" => 4 }
font = TTY::Font.new(:doom)
prompt = TTY::Prompt.new
schedule_filepath = './schedule.json'

# MAIN PROGRAM
program_running = true
puts font.write("dayplanner")
schedule = Schedule.new
schedule.load_from_json(schedule_filepath)

while program_running
    
    menu_selection = prompt.select("Menu selection", ["Add task", "Delete task", "See schedule",
                                                      "Clear schedule", "Quit"])

    case menu_selection

    when "Add task"
        anymore_tasks = true
        while anymore_tasks
            # get task information from user
            description = prompt.ask("Enter task description.\n>>", required: true)
            importance = prompt.select("How important is this task?", ["Low", "Medium", "High", "Very high"])
            due = prompt.select("When is this task due?", %w[Morning Midday Afternoon Evening])
            # create task object and add to schedule
            task = Task.new(description, importance, due)
            schedule.add_task(task)
            # add task to persistent storage
                # if file does not exist --> create it
                # append newline to file description
            # loads json at start of program
            # update json at end of program

            # print confirmation msg
            Functions.print_add_confirmation(task)
            # ask user for anymore tasks
            anymore_tasks = prompt.yes?("Do you have another tasks to do today?")
        end

    when "Delete task"
        if schedule.task_list.empty?
            puts "You currently have no tasks."
        else
            tasks_to_delete = prompt.multi_select("Select task/s to delete.", schedule.task_descriptions)
            if tasks_to_delete.empty?
                puts "You did not choose any tasks to delete."
            else
                confirm_delete = prompt.yes?("Are you sure you want to delete this task/s?")
                if confirm_delete
                    schedule.delete(tasks_to_delete)
                    puts "You deleted #{tasks_to_delete.length} task/s."
                end
            end
        end

    when "See schedule"
        puts "show schedule page"
      # to start with, just return to main menu

    when "Clear schedule"
        puts "clear schedule page"
      # to start with, just return to main menu

    when "Quit"
        puts "Goodbye!"
        program_running = false

    else
        puts "i'm not sure how you arrived here but i'm scared."
    end
end
