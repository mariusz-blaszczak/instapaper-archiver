require "rails_helper"

describe "ReportSender" do
  it "sends SMS report to specified number" do
    nexmo_key = Rails.application.secrets.fetch(:nexmo_key)
    nexmo_secret = Rails.application.secrets.fetch(:nexmo_secret)
    client = Nexmo::Client.new(key: nexmo_key, secret: nexmo_secret)
    response = client.send_message(from: 'InstArchiver', to: '+48887680333', text: 'Hello Mariusz')
  end
end
