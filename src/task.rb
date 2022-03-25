# this class is used for storing daily tasks
class Task
    attr_reader :description, :importance, :due

    def initialize(description, importance, due)
        @description = description
        @importance = importance
        @due = due
    end
end
