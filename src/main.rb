require "tty-prompt"
require "./task"
require "./schedule"

program_running = true
schedule = Schedule.new

while program_running
    prompt = TTY::Prompt.new
    menu_selection = prompt.select("Menu selection", ["Add task", "Delete task", "See schedule",
                                                      "Clear schedule", "Quit"])

    case menu_selection
    when "Add task"
        # puts "get input"
        # puts "verify input"
        # puts "add task to schedule"
        # get input
        # verify input
        # ask if anymore input?
        # if no, return to main menu
        # if yes, repeat input cycle
        all_tasks_entered = false
        until all_tasks_entered
            is_input_valid = false
            while is_input_valid == false
                puts "Enter a task description."
                print ">> "
                description = gets.strip
                if description == ""
                    puts "Invalid entry. Make sure you add a description for the task."
                else
                    is_input_valid = true
                end
            end
            is_input_valid = false
            while is_input_valid == false
                puts "How important is this task?"
                puts "1 - Low"
                puts "2 - Medium"
                puts "3 - High"
                puts "4 - Very high"
                print ">> "
                importance = gets.strip
                if %w[1 2 3 4].include?(importance)
                    is_input_valid = true
                else
                    puts "Invalid entry. Enter a number between 1 and 4."
                end
            end
            is_input_valid = false
            while is_input_valid == false
                puts "When is this task due?"
                puts "1 - Evening"
                puts "2 - Afternoon"
                puts "3 - Lunchtime"
                puts "4 - Morning"
                print ">> "
                due = gets.strip
                if %w[1 2 3 4].include?(due)
                    is_input_valid = true
                else
                    puts "Invalid entry. Enter a number between 1 and 4."
                end
            end

            task = Task.new(description, importance, due)
            schedule.add_task(task)

            is_input_valid = false
            while is_input_valid == false
                puts "Do you have another tasks to do today (y/n)?"
                anymore_tasks = gets.strip.downcase
                if %w[y n yes no].include?(anymore_tasks)
                    is_input_valid = true
                else
                    puts "Invalid entry. Enter a valid response (y/n)."
                end
            end

            all_tasks_entered = true if %w[n no].include?(anymore_tasks)
        end
    when "Delete task"
        puts "delete task page"
    when "See schedule"
        puts "show schedule page"
    when "Clear schedule"
        puts "clear schedule page"
    when "Quit"
        puts "Goodbye!"
        program_running = false
    else
        puts "i'm not sure how you arrived here but i'm scared."
    end
end
