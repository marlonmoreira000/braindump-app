require "tty-font"
require "colorize"
require "tty-prompt"

# this module contains functions used in the dayplanner app
module Functions
    class InputTooLongError < StandardError
    end

    def self.input_task_description
        prompt = TTY::Prompt.new
        begin
            description = prompt.ask("Enter task description.\n>>", required: true)
            raise InputTooLongError if description.length > 50
        rescue InputTooLongError
            puts "#{'>>'.red} Invalid input. Task decsription must be less than 50 characters."
            retry
        end
        return description
    end

    def self.input_task_importance
        prompt = TTY::Prompt.new
        importance = prompt.select("How important is this task?", ["Low", "Medium", "High", "Very high"])
        return importance
    end

    def self.input_task_due_time
        prompt = TTY::Prompt.new
        due = prompt.select("When is this task due?", %w[Morning Midday Afternoon Evening])
        return due
    end

    def self.print_add_confirmation(task_object)
        puts ""
        puts "Task added".green
        puts "Description: #{task_object.description}"
        puts "Importance: #{task_object.importance}"
        puts "Due: #{task_object.due}"
        puts ""
    end

    def self.print_welcome_screen
        font = TTY::Font.new(:doom)
        puts ""
        title = font.write("braindump.").yellow
        brain = "
                       _---~~(~~-_.
                     _{        )   )
                   ,   ) -~~- ( ,-' )_
                  (  `-,_..`., )-- '_,)
                 ( ` _)  (  -~( -_ `,  }
                 (_-  _  ~_-~~~~`,  ,' )
                   `~ -^(    __;-,((()))
                         ~~~~ {_ -_(())
                                `\\  }
                                  { }\n".magenta
        print "#{brain}#{title}"
        puts ""
    end
end
