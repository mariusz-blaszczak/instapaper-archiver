require "rails_helper"

describe SmsSender do
  let(:client) { instance_double("Client").as_null_object }
  subject { described_class.new(client: client) }

  it "sends SMS report to specified number" do
    subject.send(messege)
    expect(client).to receive(:)
  end
end
