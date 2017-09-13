class ReportSender
  def self.build(sender_name:, receiver_name:, message:)
    sender = SmsSender.build
    sender_name = sender_name
    receiver_name = receiver_name
    message = message
    new(sender: sender, sender_name: sender_name, receiver_name: receiver_name, message: message)
  end

  attr_reader :sender, :sender_name, :receiver_name, :message

  def initialize(sender:, sender_name:, receiver_name:, message:)
    @sender = sender
    @sender_name = sender_name
    @receiver_name = receiver_name
    @message = message
  end

  def send
    sender.send(
      sender: sender_name,
      receiver: receiver_name,
      message: message,
    )
  end
end