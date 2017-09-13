class SmsSender
  def self.build
    client = NexmoClientAdapter.build
    new(client: client)
  end

  attr_reader :client

  SENDER_ID = "InstArchiver".freeze
  RECEIVER_PHONE_NUMBER = "+48887680333".freeze

  def initialize(client:)
    @client = client
  end

  def send(sender: SENDER_ID, receiver: RECEIVER_PHONE_NUMBER, message:)
    client.send(
      sender: sender,
      receiver: receiver,
      message: message,
    )
  end
end