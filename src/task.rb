require "colorize"

# this class is used for storing daily tasks
class Task
    attr_reader :description, :importance, :due, :importance_score, :due_score, :is_complete

    @@importances = { "Low" => 1, "Medium" => 2, "High" => 3, "Very high" => 4 }
    @@dues = { "Evening" => 1, "Afternoon" => 2, "Midday" => 3, "Morning" => 4 }

    def initialize(description, importance, due)
        @description = description
        @importance = importance
        @importance_score = @@importances[@importance]
        @due = due
        @due_score = @@dues[@due]
        @is_complete = false
    end

    def status_colorized
        @is_complete ? "Complete".green : "Incomplete".red
    end
end
