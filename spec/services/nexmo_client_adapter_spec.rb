require "rails_helper"

describe NexmoClientAdapter do

  describe "#build" do
    it "instiantiate Nexmo Client with credentials from rails secrets" do
      expect { described_class.build }.to_not raise_error
    end
  end

  describe "#send" do
    let(:external_sms_client) { instance_double("Nexmo::Client") }
    subject { described_class.new(external_sms_client) }
    it "calls client's API method to send SMS" do
      expect(external_sms_client)
        .to receive(:send_message)
        .with(
          from: "Application",
          to: "+48777444111", 
          text: "Test!",
        )
      subject.send(message: "Test!", receiver: "+48777444111", sender: "Application")
    end
  end
end
