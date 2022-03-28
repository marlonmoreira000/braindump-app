# this module contains functions used in the dayplanner app
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
end
