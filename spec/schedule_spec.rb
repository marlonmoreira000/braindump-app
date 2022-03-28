require "./src/task"
require "./src/schedule"

describe Schedule do
    let(:schedule1) { Schedule.new([Task.new("do resume", 1, 2)]) }
    let(:schedule2) { Schedule.new }

    context "* general requirements" do
        it "can be instantiated" do
            expect(schedule1).not_to be_nil
            expect(schedule1).to be_an_instance_of Schedule
        end
        it "has an empty task list if no task list is passed in" do
            expect(schedule2.task_list).to eq []
        end
    end

    context "* instance methods" do
        it "task_descriptions method returns correct values" do
            expect(schedule1.task_descriptions).to eq ["do resume"]
        end
        it "delete method returns correct values" do
            schedule1.delete(["do resume"])
            expect(schedule1.task_list).to eq []
        end
    end
end
