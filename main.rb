require "tty-prompt"

program_running = true

while program_running
    prompt = TTY::Prompt.new
    menu_selection = prompt.select("Menu selection", ["Add task", "Delete task", "See schedule",
                                                      "Clear schedule", "Quit"])

    case menu_selection
    when "Add task"
        puts "add task page"
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
        puts "i'm not sure how you arrived her but i'm scared."
    end
end
