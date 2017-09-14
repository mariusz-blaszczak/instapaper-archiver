require "rails_helper"

describe SmsNotifier do
  let(:client) { instance_double(NexmoClientAdapter) }
  subject { described_class.new(client: client, sender: "Admin", receiver: "User") }

  it "calls send on client with correct args" do
    expect(client).to receive(:send).with(sender: "Admin", receiver: "User", message: "Hello User")
    subject.send("Hello User")
  end
end
