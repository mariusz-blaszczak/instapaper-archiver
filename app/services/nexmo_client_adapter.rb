class NexmoClientAdapter
  def self.build
    nexmo_key = Rails.application.secrets.fetch(:nexmo_key)
    nexmo_secret = Rails.application.secrets.fetch(:nexmo_secret)
    client = Nexmo::Client.new(key: nexmo_key, secret: nexmo_secret)
    new(client)
  end

  attr_reader :client

  def initialize(client)
    @client = client
  end

  def send(sender:, receiver:, message:)
    client.send_message(
      from: sender, 
      to: receiver, 
      text: message)
  end
end