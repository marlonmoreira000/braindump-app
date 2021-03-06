# IMPORTS
require "tty-prompt"
require "colorize"
require "./functions"
require "./task"
require "./schedule"

# CONSTANTS
font = TTY::Font.new(:doom)
prompt = TTY::Prompt.new
storage_filepath = './schedule.json'

begin
    # MAIN PROGRAM
    program_running = true
    Functions.print_welcome_screen
    schedule = Schedule.new
    schedule.load_from_json(storage_filepath)

    # keep running the app until the user selects 'Quit'
    while program_running
        menu_selection = Functions.main_menu_selection
        case menu_selection

        when "Add task/s"
            anymore_tasks = true
            while anymore_tasks
                # I did have manual error handling for the following user input but I realised tty-prompt
                #  has it inbuild alredy, so I removed mine. I confirmed this was ok with Matt.
                description = Functions.input_task_description
                importance = Functions.input_task_importance
                due = Functions.input_task_due_time
                task = Task.new(description, importance, due, false)
                schedule.add_task(task)
                Functions.print_add_confirmation(task)
                anymore_tasks = prompt.yes?("Do you have another tasks to do today?")
            end

        when "Delete task/s"
            if schedule.task_list.empty?
                Functions.print_msg("You currently have no tasks.")
            else
                tasks_to_delete = prompt.multi_select("Select task/s to delete.", schedule.task_descriptions)
                if tasks_to_delete.empty?
                    Functions.print_msg("No tasks were deleted.")
                else
                    confirm_delete = prompt.yes?("Are you sure you want to delete this task/s?")
                    if confirm_delete
                        schedule.delete_tasks(tasks_to_delete)
                        puts "#{'>>'.red} You deleted #{tasks_to_delete.length} task/s."
                    end
                end
            end

        when "Mark as complete"
            if schedule.task_list.empty?
                Functions.print_msg("You currently have no tasks.")
            elsif schedule.all_tasks_complete?
                Functions.print_msg("All tasks have been completed.")
            else
                completed_tasks = prompt.multi_select("Select task/s you've completed.",
                                                      schedule.task_descriptions_completed)
                if completed_tasks.empty?
                    Functions.print_msg("No tasks were selected.")
                else
                    schedule.mark_tasks_as_complete(completed_tasks)
                    puts "#{'>>'.red} You comleted #{completed_tasks.length} task/s."
                end
                if schedule.all_tasks_complete?
                    puts ""
                    puts font.write("All  finished!").yellow
                end
            end

        when "See schedule"
            if schedule.task_list.empty?
                Functions.print_msg("You currently have no tasks.")
            else
                schedule.show_table
            end

        when "Clear schedule"
            if schedule.task_list.empty?
                Functions.print_msg("You currently have no tasks.")
            else
                confirm_delete = prompt.yes?("Are you sure you want to delete all tasks?")
                if confirm_delete
                    schedule.delete_all_tasks
                    Functions.print_msg("You deleted all tasks.")
                end
            end

        when "Quit"
            puts "Goodbye!"
            program_running = false
            # update persistent storage with new task
            schedule.update_storage(storage_filepath)

        else
            puts Functions.print_msg("Not sure how you got here but i'm scared :(")
        end
    end
# Handle error is someone exits the program using ctrl+c
rescue TTY::Reader::InputInterrupt => e
    puts ""
    puts "Error (#{e.message.red}): program unexpectedly exited".red
end
