require "rails_helper"

describe Instapaper::Archive do
  it "archives all articles" do
    result = described_class.new.call
    expect(result.success?).to be_truthy
  end
end
