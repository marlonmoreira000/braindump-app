require "colorize"

# this class is used for storing daily tasks
class Task
    # access permissions
    attr_reader :description, :importance, :due, :importance_score, :due_score, :is_complete

    # class variables
    @@importances = { "Low" => 1, "Medium" => 2, "High" => 3, "Very high" => 4 }
    @@dues = { "Evening" => 1, "Afternoon" => 2, "Midday" => 3, "Morning" => 4 }

    # instance variables
    def initialize(description, importance, due, is_complete)
        @description = description
        @importance = importance
        @importance_score = @@importances[@importance]
        @due = due
        @due_score = @@dues[@due]
        @is_complete = is_complete
    end

    # instance methods
    def mark_as_complete
        @is_complete = true
    end

    def status_colorized
        @is_complete ? "Complete".green : "Incomplete".red
    end
end
