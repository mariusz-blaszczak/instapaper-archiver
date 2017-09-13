require "rails_helper"

describe "rake instapaper:archive", type: :task do
  context "it is saturday" do
    before { Timecop.freeze(Time.new(2017, 9, 2)) }
    after { Timecop.return }
    
    it "runs archives articles service" do
      expect_any_instance_of(Instapaper::Archive).to receive(:call) { double("Archive").as_null_object }
      task.execute
    end
  end

  context "it is not saturday" do
    before { Timecop.freeze(Time.new(2017, 9, 3)) }
    after { Timecop.return }
    it "does not run archives articles service" do
      expect_any_instance_of(Instapaper::Archive).to_not receive(:call) { double("Archive").as_null_object }
      task.execute
    end
  end
end
