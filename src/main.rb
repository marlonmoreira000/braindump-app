# IMPORTS
require "tty-prompt"
require "tty-font"
require "./functions"
require "./task"
require "./schedule"

# CONSTANTS
importances = { "Low" => 1, "Medium" => 2, "High" => 3, "Very high" => 4 }
dues = { "Evening" => 1, "Afternoon" => 2, "Lunchtime" => 3, "Morning" => 4 }
font = TTY::Font.new(:doom)

# MAIN PROGRAM
program_running = true
puts font.write("dayplanner")
schedule = Schedule.new

while program_running
    prompt = TTY::Prompt.new
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
            # print confirmation msg
            Functions.print_add_confirmation(task)
            # ask user for anymore tasks
            anymore_tasks = prompt.yes?("Do you have another tasks to do today?")
        end

    when "Delete task"
        puts "delete task page"
        # print all current tasks
        tasks_to_delete = prompt.multi_select("Select task/s to delete.", schedule.task_descriptions)
        p tasks_to_delete
      # same logic and output as add task

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
