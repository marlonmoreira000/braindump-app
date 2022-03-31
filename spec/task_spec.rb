require "./src/task"

describe Task do
    let(:task) { Task.new("do resume", 1, 2, false) }

    context "* general requirements" do
        it "can be instantiated" do
            expect(task).not_to be_nil
            expect(task).to be_an_instance_of Task
        end
    end

    context "* instance variables" do
        it "gets task description" do
            expect(task.description).to eq "do resume"
        end
        it "gets task importance" do
            expect(task.importance).to eq 1
        end
        it "gets task due time" do
            expect(task.due).to eq 2
        end
    end
end
