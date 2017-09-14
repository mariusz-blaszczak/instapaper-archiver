require "rails_helper"

describe "rake instapaper:archive", type: :task do
  before do
    allow_any_instance_of(Instapaper::Archive).to receive(:call)
  end
    
  it "cakls Instapaper::Archive use case" do
    expect_any_instance_of(Instapaper::Archive).to receive(:call)
    task.execute
  end
end
