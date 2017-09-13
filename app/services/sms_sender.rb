class SmsSender
  attr_reader :client, :receiver, :sender

  SENDER_ID = "InstArchiver".freeze
  RECEIVER_PHONE_NUMBER = "+48887680333".freeze

  def initialize(client: NexmoClientAdapter.build, sender: SENDER_ID, receiver: RECEIVER_PHONE_NUMBER)
    @client = client
    @sender = sender
    @receiver = receiver
  end

  def send(message)
    client.send(
      sender: sender,
      receiver: receiver,
      message: message,
    )
  end
end