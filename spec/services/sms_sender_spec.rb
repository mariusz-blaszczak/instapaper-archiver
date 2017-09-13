require "rails_helper"

describe SmsSender do
  let(:client) { instance_double(NexmoClientAdapter) }
  subject { described_class.new(client: client) }

  it "calls send on client with correct args" do
    expect(client).to receive(:send).with(sender: "Admin", receiver: "User", message: "Hello User")
    subject.send(sender: "Admin", receiver: "User", message: "Hello User")
  end
end
