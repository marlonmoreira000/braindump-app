# this class is used for storing daily tasks
class Task
    attr_reader :description, :importance, :due

    @@importances = { "Low" => 1, "Medium" => 2, "High" => 3, "Very high" => 4 }
    @@dues = { "Evening" => 1, "Afternoon" => 2, "Lunchtime" => 3, "Morning" => 4 }

    def initialize(description, importance, due)
        @description = description
        @importance = importance
        @importance_score = @@importances[@importance]
        @due = due
        @due_score = @@dues[@due]
    end
end
