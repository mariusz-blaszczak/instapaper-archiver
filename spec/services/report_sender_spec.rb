require "rails_helper"

describe ReportSender do
  let(:sender) { instance_double(SmsSender) }
  subject { described_class.new(sender: sender, sender_name: "Admin", receiver_name: "User", message: "Hello User") }
  it "cals sender with " do
    expect(sender).to receive(:send).with(sender: "Admin", receiver: "User", message: "Hello User")
    subject.send()
  end
end
