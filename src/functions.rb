# this module contains functions used in the dayplanner app
require "tty-font"

module Functions
    def self.print_add_confirmation(task_object)
        puts ""
        puts "Task added."
        puts "-----------"
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
                         _.-'-'--._
                       ,', ~'` ( .'`.
                      ( ~'_ , .'(  >-)
                     ( .-' (  `__.-<  )
                      ( `-..--'_   .-')
                       `(_( (-' `-'.-)
                           `-.__.-'=/
                              `._`='\n".magenta
        print "#{brain}#{title}"
        puts ""
    end
end
